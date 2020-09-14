# views.py (qar5)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of qar5 views."""

from datetime import datetime
from io import BytesIO
from openpyxl import Workbook
from os import getcwd, path, remove
import tempfile
from wkhtmltopdf.views import PDFTemplateResponse
from zipfile import ZipFile
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.contrib.staticfiles.finders import find
from django.http import FileResponse, HttpResponseRedirect, HttpRequest, \
    HttpResponse, JsonResponse
from django.shortcuts import render
from django.template.loader import get_template, render_to_string
from django.templatetags.static import static
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.generic import CreateView, DetailView, ListView, \
    TemplateView, UpdateView, DeleteView
from constants.qar5 import SECTION_A_INFO, SECTION_C_DEFAULTS, \
    C3_QUALITY_METRICS, SECTION_D_INFO, SECTION_E_INFO, SECTION_F_INFO
from constants.qar5_sectionb import SECTION_B_INFO
from DataSearch.settings import DATETIME_FORMAT, DEBUG, STATIC_ROOT
from qar5.forms import QappForm, QappApprovalForm, QappLeadForm, \
    QappApprovalSignatureForm, SectionAForm, SectionBForm, \
    SectionDForm, RevisionForm, ReferencesForm
from qar5.models import Qapp, QappApproval, QappLead, QappApprovalSignature, \
    SectionA, SectionB, SectionBType, SectionC, SectionD, \
    QappSharingTeamMap, Revision, References
from teams.models import Team, TeamMembership


def get_qapp_all():
    """Method to get all data regardless of user or team."""
    return Qapp.objects.all()


class QappIndex(LoginRequiredMixin, TemplateView):
    """Class to return the first page of the Existing Data flow."""

    template_name = 'qapp_index.html'

    def get_context_data(self, **kwargs):
        """
        Custom method override to send data to the template.

        - Specifically, want to send a list of users and teams to select from.
        """
        context = super().get_context_data(**kwargs)
        context['users'] = User.objects.all()
        context['teams'] = Team.objects.all()
        return context


class QappList(LoginRequiredMixin, ListView):
    """Class for listing this user's (or all if admin) QAPP objects."""

    model = Qapp
    template_name = 'qapp_list.html'
    context_object_name = 'qapp_list'

    def get_context_data(self, **kwargs):
        """
        Custom method override to send data to the template.

        - Specifically, want to send the user or team information for this
          list of data.
        """
        context = super().get_context_data(**kwargs)
        path = self.request.path.split('/')
        p_id = path[len(path) - 1]
        p_type = path[len(path) - 2]
        if p_type == 'user':
            context['p_user'] = User.objects.get(id=p_id)
        elif p_type == 'team':
            context['team'] = Team.objects.get(id=p_id)
        return context

    def get_queryset(self):
        """Add method docstring."""  # TODO add docstring.
        path = self.request.path.split('/')
        p_id = path[len(path) - 1]
        p_type = path[len(path) - 2]
        if p_type == 'user':
            return get_qar5_for_user(p_id)
        if p_type == 'team':
            return get_qar5_for_team(p_id)
        return get_qapp_all()


def check_can_edit(qapp, user):
    """
    Method used to check if the provided user can edit the provided qapp.

    All of the user's member teams are checked as well as the user's
    super user status or qapp ownership status.
    """
    # Check if any of the user's teams have edit privilege:
    user_teams = TeamMembership.objects.filter(
        member=user).values_list('team', flat=True)

    for team in user_teams:
        data_team_map = QappSharingTeamMap.objects.filter(
            qapp=qapp, team=team).first()
        if data_team_map and data_team_map.can_edit:
            return True

    # Check if the user is super or owns the qapp:
    return user.is_superuser or qapp.prepared_by == user


class QappEdit(LoginRequiredMixin, UpdateView):
    """View for editing the details of an existing Qapp instance."""

    model = Qapp
    form_class = QappForm
    template_name = 'qapp_edit.html'

    def get(self, request, *args, **kwargs):
        """
        Override default get request so we can verify the user has
        edit privileges, either through super status or team membership.
        """
        pk = kwargs.get('pk')
        qapp = Qapp.objects.filter(id=pk).first()
        if check_can_edit(qapp, request.user):
            # We need to make sure we return a QappApproval form for editing:
            qapp_approval = QappApproval.objects.filter(qapp_id=pk).first()
            approval_form = QappApprovalForm(instance=qapp_approval)
            return render(request, self.template_name,
                          {'object': qapp, 'form': QappForm(instance=qapp),
                           'approval_form': approval_form})

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % pk, 401, reason)

    def form_valid(self, form, *args, **kwargs):
        """Qapp Edit Form validation and redirect."""
        # Verify the current user has permissions to modify this QAPP:
        self.object = form.save(commit=False)
        if not check_can_edit(self.object, self.request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/detail/%s' % self.object.id, 401, reason)

        self.object.save()
        # Prepare and insert teams data.
        if form.cleaned_data['teams']:
            form_teams = form.cleaned_data['teams']

            # Remove any team maps that have been deselected:
            remove_teams = QappSharingTeamMap.objects.filter(
                qapp=self.object).exclude(team__in=form_teams)

            for team in remove_teams:
                team.delete()

            # Insert or update selected team maps:
            for team in form_teams:
                data_team_map = QappSharingTeamMap.objects.filter(
                    qapp=self.object, team=team).first()
                # Create new team map if not exists:
                if not data_team_map:
                    data_team_map = QappSharingTeamMap()
                    data_team_map.team = team
                    data_team_map.qapp = self.object
                # Update (or set) the can_edit field:
                data_team_map.can_edit = form.cleaned_data['can_edit']
                data_team_map.save()
        # Return back to the details page:
        return HttpResponseRedirect('/qar5/detail/' + str(self.object.id))
        return HttpResponseRedirect('/qar5/detail/' + str(self.object.id))


class QappCreate(LoginRequiredMixin, CreateView):
    """Class for creating new QAPPs (Quality Assurance Project Plans)."""

    model = Qapp
    template_name = 'qapp_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new QAPP."""
        return render(
            request, 'qapp_create.html',
            {'form': QappForm(user=request.user),
             'project_lead_class': QappLeadForm})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new QAPP form filled out."""
        form = QappForm(request.POST, user=request.user)
        if form.is_valid():
            obj = form.save(commit=False)
            # Assign current user as the prepared_by
            obj.prepared_by = request.user
            obj.save()
            # Prepare and insert teams data.
            if form.cleaned_data['teams']:
                for team in form.cleaned_data['teams']:
                    data_team_map = QappSharingTeamMap()
                    data_team_map.can_edit = form.cleaned_data['can_edit']
                    data_team_map.team = team
                    data_team_map.qapp = obj
                    data_team_map.save()

            return HttpResponseRedirect(
                '/qar5/approval/create?qapp_id=%d' % obj.id)

        return render(request, 'qapp_create.html', {'form': form})


class QappDetail(LoginRequiredMixin, DetailView):
    """Class for viewing an existing (newly created) QAPP."""

    model = Qapp
    template_name = 'qapp_detail.html'

    def get_context_data(self, **kwargs):
        """Add method docstring."""  # TODO add docstring.
        context = super().get_context_data(**kwargs)
        context['project_leads_list'] = QappLead.objects.filter(
            qapp=context['object'])
        context['project_approval'] = QappApproval.objects.get(
            qapp=context['object'])
        context['project_approval_signatures'] = \
            QappApprovalSignature.objects.filter(
                qapp_approval=context['project_approval'])
        context['SECTION_A_INFO'] = SECTION_A_INFO
        if not check_can_edit(context['object'], self.request.user):
            context['edit_message'] = \
                'You cannot edit this QAPP.'
        return context


class ProjectLeadCreate(LoginRequiredMixin, CreateView):
    """Class for creating new QAPP Project Lead."""

    model = QappLead
    template_name = 'SectionA/project_lead_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Project Lead."""
        qapp_id = request.GET.get('qapp_id', 0)
        qapp = Qapp.objects.get(id=qapp_id)

        if check_can_edit(qapp, request.user):
            form = QappLeadForm({'qapp': qapp})
            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project Lead form filled out."""
        form = QappLeadForm(request.POST)
        qapp_id = request.POST.get('qapp', None)
        qapp = Qapp.objects.get(id=qapp_id)

        if check_can_edit(qapp, request.user):
            if form.is_valid():
                obj = form.save(commit=True)
                return HttpResponseRedirect(
                    '/qar5/detail/%s' % qapp_id)
            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)


class ProjectLeadDelete(LoginRequiredMixin, DeleteView):
    """Class view for deleting approval signatures."""

    model = QappLead
    template_name = 'SectionA/confirm_delete.html'

    def get_success_url(self):
        return '/qar5/detail/%s' % self.object.qapp.id

    def dispatch(self, *args, **kwargs):
        pk = kwargs.get('pk')
        instance = QappLead.objects.filter(id=pk).first()
        if instance:
            user = self.request.user
            if check_can_edit(instance.qapp, user) or user.is_superuser:
                return super().dispatch(*args, **kwargs)
        return HttpResponseRedirect(self.get_success_url)


class ProjectLeadEdit(LoginRequiredMixin, UpdateView):
    """Class view for editing project leads."""

    model = QappLead
    form_class = QappLeadForm
    template_name = 'SectionA/project_lead_create.html'

    def get(self, request, *args, **kwargs):
        """
        Override default get request so we can verify the user has
        edit privileges, either through super status or team membership.
        """
        pk = kwargs.get('pk')
        object = self.model.objects.filter(id=pk).first()
        if check_can_edit(object.qapp, request.user):
            return render(request, self.template_name,
                          {'object': object,
                           'form': self.form_class(instance=object),
                           'qapp_id': object.qapp.id})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect(
            '/qar5/detail/%s' % object.qapp.id, 401, reason)

    def post(self, request, *args, **kwargs):
        """Process the post request with a modified Existing Data form."""
        pk = kwargs.get('pk')
        instance = self.model.objects.filter(id=pk).first()
        qapp = instance.qapp
        if check_can_edit(qapp, request.user):
            form = self.form_class(request.POST, instance=instance)
            if form.is_valid():
                form.save()
                return HttpResponseRedirect('/qar5/detail/%s' % qapp.id)

            return render(request, self.template_name, {'form': form})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp.id, 401, reason)


class ProjectApprovalCreate(LoginRequiredMixin, CreateView):
    """
    Create the base approval page with no signatures.

    Approval signatures will be added after the title and number.
    """

    template_name = 'SectionA/qapp_approval_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new QAPP."""
        qapp_id = request.GET.get('qapp_id', 0)
        qapp = Qapp.objects.get(id=qapp_id)

        if check_can_edit(qapp, request.user):
            form = QappApprovalForm({'qapp': qapp})
            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project Lead form filled out."""
        form = QappApprovalForm(request.POST)
        qapp_id = form.data.get('qapp', '')
        qapp = Qapp.objects.get(id=qapp_id)

        if check_can_edit(qapp, request.user):
            if form.is_valid():
                obj = form.save(commit=True)
                return HttpResponseRedirect('/qar5/detail/%s' % qapp_id)

            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)


class ProjectApprovalEdit(LoginRequiredMixin, UpdateView):
    """View for editing the details of an existing Qapp Approval page."""

    model = QappApproval
    form_class = QappApprovalForm
    template_name = 'SectionA/qapp_approval_edit.html'

    def get(self, request, *args, **kwargs):
        """
        Override default get request so we can verify the user has
        edit privileges, either through super status or team membership.
        """
        pk = kwargs.get('pk')
        qapp = Qapp.objects.filter(id=pk).first()
        if check_can_edit(qapp, request.user):
            # We need to make sure we return a QappApproval form for editing:
            qapp_approval = QappApproval.objects.filter(qapp_id=pk).first()
            return render(request, self.template_name,
                          {'object': qapp_approval, 'qapp_id': pk,
                           'form': QappApprovalForm(instance=qapp_approval)})

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % pk, 401, reason)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Save the changes to the form."""
        pk = kwargs.get('pk')
        instance = QappApproval.objects.filter(qapp_id=pk).first()
        if check_can_edit(instance.qapp, request.user):
            form = QappApprovalForm(request.POST, instance=instance)
            if form.is_valid():
                form.save()
                return HttpResponseRedirect('/qar5/detail/%s' % pk)
            return render(request, self.template_name,
                          {'qapp_id': pk, 'form': form})

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % pk, 401, reason)


class ProjectApprovalSignatureCreate(LoginRequiredMixin, CreateView):
    """Class for creating new QAPP Project Approval Signatures."""

    model = QappApprovalSignature
    template_name = 'SectionA/project_approval_signature_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """
        Return a view with an empty form for creating a new Approval
        Signature.
        """
        qapp_id = request.GET.get('qapp_id', 0)
        qapp = Qapp.objects.get(id=qapp_id)
        if check_can_edit(qapp, request.user):
            qapp_approval = QappApproval.objects.get(qapp=qapp)
            form = QappApprovalSignatureForm(
                {'qapp': qapp, 'qapp_approval': qapp_approval})
            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project Lead form filled out."""
        form = QappApprovalSignatureForm(request.POST)
        approval_id = request.POST.get('qapp_approval', None)
        approval = QappApproval.objects.get(id=approval_id)
        qapp_id = approval.qapp.id

        if check_can_edit(approval.qapp, request.user):
            if form.is_valid():
                obj = form.save(commit=True)
                return HttpResponseRedirect(
                    '/qar5/detail/%s' % qapp_id)
            ctx = {'form': form, 'qapp_id': qapp_id}
            return render(request, self.template_name, ctx)

        reason = 'You cannot edit this QAPP.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp_id, 401, reason)


class ProjectApprovalSignatureDelete(LoginRequiredMixin, DeleteView):
    """Class view for deleting approval signatures."""

    model = QappApprovalSignature
    template_name = 'SectionA/confirm_delete.html'

    def get_success_url(self):
        return '/qar5/detail/%s' % self.object.qapp_approval.qapp.id

    def dispatch(self, *args, **kwargs):
        pk = kwargs.get('pk')
        instance = QappApprovalSignature.objects.filter(id=pk).first()
        if instance:
            qapp = instance.qapp_approval.qapp
            user = self.request.user
            if check_can_edit(qapp, user) or user.is_superuser:
                return super().dispatch(*args, **kwargs)
        return HttpResponseRedirect(self.get_success_url)


class ProjectApprovalSignatureEdit(LoginRequiredMixin, UpdateView):
    """Class view for editing approval signatures."""

    model = QappApprovalSignature
    form_class = QappApprovalSignatureForm
    template_name = 'SectionA/project_approval_signature_create.html'

    def get(self, request, *args, **kwargs):
        """
        Override default get request so we can verify the user has
        edit privileges, either through super status or team membership.
        """
        pk = kwargs.get('pk')
        object = self.model.objects.filter(id=pk).first()
        if check_can_edit(object.qapp_approval.qapp, request.user):
            return render(request, self.template_name,
                          {'object': object,
                           'form': self.form_class(instance=object),
                           'qapp_id': object.qapp_approval.qapp.id})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect(
            '/qar5/detail/%s' % object.qapp_approval.qapp.id, 401, reason)

    def post(self, request, *args, **kwargs):
        """Process the post request with a modified Existing Data form."""
        pk = kwargs.get('pk')
        instance = self.model.objects.filter(id=pk).first()
        qapp = instance.qapp_approval.qapp
        if check_can_edit(qapp, request.user):
            form = self.form_class(request.POST, instance=instance)
            if form.is_valid():
                form.save()
                return HttpResponseRedirect('/qar5/detail/%s' % qapp.id)

            return render(request, self.template_name, {'form': form})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect('/qar5/detail/%s' % qapp.id, 401, reason)


class SectionAView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section A (A.3 and later) information."""

    template_name = 'SectionA/index.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section A (A.3 and later)."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)
        existing_section_a = SectionA.objects.filter(qapp=qapp).first()

        if existing_section_a:
            form = SectionAForm(instance=existing_section_a)

        else:
            form = SectionAForm({'qapp': qapp,
                                 'a3': SECTION_A_INFO['a3'],
                                 'a9': SECTION_A_INFO['a9']})

        edit_message = ''
        if not check_can_edit(qapp, request.user):
            edit_message = 'You cannot edit this QAPP.'

        return render(request, self.template_name,
                      {'title': 'QAPP Section A', 'qapp_id': qapp_id,
                       'SECTION_A_INFO': SECTION_A_INFO, 'form': form,
                       'edit_message': edit_message})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a SectionA form filled out."""
        ctx = {'qapp_id': request.GET.get('qapp_id', None),
               'SECTION_A_INFO': SECTION_A_INFO, 'title': 'QAPP Section A'}

        qapp = Qapp.objects.get(id=ctx['qapp_id'])
        if not check_can_edit(qapp, request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/SectionA?qapp_id=%s' % qapp.id, 401, reason)

        existing_section_a = SectionA.objects.filter(qapp=qapp).first()

        # Update if existing, otherwise insert new:
        if existing_section_a:
            ctx['form'] = SectionAForm(instance=existing_section_a,
                                       data=request.POST)
        else:
            ctx['form'] = SectionAForm(request.POST)

        if ctx['form'].is_valid():
            ctx['obj'] = ctx['form'].save(commit=True)
            ctx['save_success'] = 'Successfully Saved Changes!'

        return render(request, self.template_name, ctx)


class SectionBView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section B information."""

    template_name = 'SectionB/index.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section B."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)
        sectiona = SectionA.objects.filter(qapp_id=qapp_id).first()
        selected_sectionb_types = sectiona.sectionb_type.all()

        edit_message = ''
        if not check_can_edit(qapp, request.user):
            edit_message = 'You cannot edit this QAPP.'

        if not sectiona or not selected_sectionb_types:
            form = SectionAForm({'qapp': qapp,
                                 'a3': SECTION_A_INFO['a3'],
                                 'a9': SECTION_A_INFO['a9']})
            error_message = 'Please select one or more Section B Types ' + \
                'from the list before moving onto the next page, Section B.'
            return render(request, 'SectionA/index.html',
                          {'title': 'QAPP Section A', 'qapp_id': qapp_id,
                           'SECTION_A_INFO': SECTION_A_INFO, 'form': form,
                           'error_message': error_message,
                           'edit_message': edit_message})

        sectionb_type_id = request.GET.get('sectionb_type', None)
        if not sectionb_type_id:
            sectionb_type = selected_sectionb_types[0]
        else:
            sectionb_type = selected_sectionb_types.filter(id=int(sectionb_type_id)).first()

        existing_section_b = SectionB.objects.filter(
            qapp=qapp, sectionb_type=sectionb_type).first()

        if existing_section_b:
            form = SectionBForm(
                instance=existing_section_b,
                section_b_info=SECTION_B_INFO[
                    existing_section_b.sectionb_type.name])

        else:
            # Start with whatever the first sectionb_type is:
            form = SectionBForm(
                {'qapp': qapp, 'sectionb_type': sectionb_type},
                section_b_info=SECTION_B_INFO[sectionb_type.name])

        return render(request, self.template_name,
                      {'title': 'QAPP Section B', 'qapp_id': qapp_id,
                       'SECTION_B_INFO': SECTION_B_INFO[sectionb_type.name],
                       'form': form, 'sectionb_type': sectionb_type,
                       'selected_sectionb_types': selected_sectionb_types,
                       'edit_message': edit_message})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a SectionB form filled out."""
        ctx = {'qapp_id': request.GET.get('qapp_id', None),
               'SECTION_B_INFO': SECTION_B_INFO, 'title': 'QAPP Section B'}

        qapp = Qapp.objects.get(id=ctx['qapp_id'])
        if not check_can_edit(qapp, request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/SectionB?qapp_id=%s' % qapp.id, 401, reason)

        sectionb_type_id = request.POST.get('sectionb_type')
        ctx['sectionb_type'] = qapp.sectiona.sectionb_type.filter(
            id=sectionb_type_id).first()

        existing_section_b = SectionB.objects.filter(
            qapp=qapp, sectionb_type=ctx['sectionb_type']).first()

        ctx['selected_sectionb_types'] = qapp.sectiona.sectionb_type.all()

        # Update if existing, otherwise insert new:
        if existing_section_b:
            ctx['form'] = SectionBForm(
                instance=existing_section_b, data=request.POST,
                section_b_info=SECTION_B_INFO[ctx['sectionb_type'].name])
        else:
            ctx['form'] = SectionBForm(
                request.POST,
                section_b_info=SECTION_B_INFO[ctx['sectionb_type'].name])

        if ctx['form'].is_valid():
            ctx['obj'] = ctx['form'].save(commit=True)
            ctx['save_success'] = 'Successfully Saved Changes!'

        return render(request, self.template_name, ctx)


class SectionCView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section C information."""

    template_name = 'SectionC/index.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section C."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)

        return render(request, self.template_name,
                      {'title': 'QAPP Section C', 'qapp_id': qapp_id,
                       'SECTION_C_DEFAULTS': SECTION_C_DEFAULTS,
                       'c3_info': C3_QUALITY_METRICS})


class SectionDView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section D information."""

    template_name = 'SectionD/index.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section D."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)
        edit_message = ''
        if not check_can_edit(qapp, request.user):
            edit_message = 'You cannot edit this QAPP.'
        existing_section_d = SectionD.objects.filter(qapp=qapp).first()

        if existing_section_d:
            form = SectionDForm(instance=existing_section_d)

        else:
            form = SectionDForm({'qapp': qapp})

        return render(request, self.template_name,
                      {'title': 'QAPP Section D', 'qapp_id': qapp_id,
                       'SECTION_D_INFO': SECTION_D_INFO,
                       'form': form, 'edit_message': edit_message})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a SectionD form filled out."""
        ctx = {'qapp_id': request.GET.get('qapp_id', None),
               'SECTION_D_INFO': SECTION_D_INFO, 'title': 'QAPP Section D'}

        qapp = Qapp.objects.get(id=ctx['qapp_id'])
        if not check_can_edit(qapp, request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/SectionD?qapp_id=%s' % qapp.id, 401, reason)

        existing_section_d = SectionD.objects.filter(qapp=qapp).first()

        # Update if existing, otherwise insert new:
        if existing_section_d:
            ctx['form'] = SectionDForm(instance=existing_section_d,
                                       data=request.POST)
        else:
            ctx['form'] = SectionDForm(request.POST)

        if ctx['form'].is_valid():
            ctx['obj'] = ctx['form'].save(commit=True)
            ctx['save_success'] = 'Successfully Saved Changes!'

        return render(request, self.template_name, ctx)


class SectionEView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section E information."""

    template_name = 'SectionE/index.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section E."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)
        edit_message = ''
        if not check_can_edit(qapp, request.user):
            edit_message = 'You cannot edit this QAPP.'
        existing_references = References.objects.filter(qapp=qapp).first()

        # Update if existing, otherwise insert new:
        if existing_references:
            form = ReferencesForm(instance=existing_references)
        else:
            form = ReferencesForm({'qapp': qapp})

        return render(request, self.template_name,
                      {'title': 'QAPP Section E', 'qapp_id': qapp_id,
                       'SECTION_E_INFO': SECTION_E_INFO, 'form': form,
                       'edit_message': edit_message})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a SectionE form filled out."""
        ctx = {'qapp_id': request.GET.get('qapp_id', None),
               'SECTION_E_INFO': SECTION_E_INFO, 'title': 'QAPP Section E'}

        qapp = Qapp.objects.get(id=ctx['qapp_id'])
        if not check_can_edit(qapp, request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/SectionE?qapp_id=%s' % qapp.id, 401, reason)

        existing_references = References.objects.filter(qapp=qapp).first()

        # Update if existing, otherwise insert new:
        if existing_references:
            ctx['form'] = ReferencesForm(instance=existing_references,
                                         data=request.POST)
        else:
            ctx['form'] = ReferencesForm(request.POST)

        if ctx['form'].is_valid():
            ctx['obj'] = ctx['form'].save(commit=True)
            ctx['save_success'] = 'Successfully Saved Changes!'

        return render(request, self.template_name, ctx)


class SectionFView(LoginRequiredMixin, TemplateView):
    """Class for processing QAPP Section F information, REVISIONS."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return the index page for QAPP Section F."""
        assert isinstance(request, HttpRequest)
        qapp_id = request.GET.get('qapp_id', None)
        qapp = Qapp.objects.get(id=qapp_id)
        edit_message = ''
        if not check_can_edit(qapp, request.user):
            edit_message = 'You cannot edit this QAPP.'
        revisions = Revision.objects.filter(qapp_id=qapp_id)
        return render(request, 'SectionF/index.html',
                      {'title': 'QAPP Section F', 'qapp_id': qapp_id,
                       'SECTION_F_INFO': SECTION_F_INFO,
                       'revisions': revisions, 'edit_message': edit_message})


class RevisionCreate(LoginRequiredMixin, CreateView):
    """Class for creating new Revisions of a given QAPP."""

    template_name = 'SectionF/revision_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new QAPP."""
        qapp_id = request.GET.get('qapp_id', 0)
        qapp = Qapp.objects.get(id=qapp_id)
        form = RevisionForm({'qapp': qapp})
        ctx = {'form': form, 'qapp_id': qapp_id}

        return render(request, self.template_name, ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project Lead form filled out."""
        form = RevisionForm(request.POST)
        qapp_id = form.data.get('qapp', '')
        qapp = Qapp.objects.filter(id=qapp_id).first()
        if not check_can_edit(qapp, request.user):
            reason = 'You cannot edit this QAPP.'
            return HttpResponseRedirect('/qar5/revisions?qapp_id=%s' % qapp.id, 401, reason)
        # datetime_str = form.data['effective_date']
        # datetime_obj = datetime.strptime(datetime_str, DATETIME_FORMAT)
        # form.data['effective_date'] = datetime_obj
        if form.is_valid():
            obj = form.save(commit=True)
            return HttpResponseRedirect(
                '/qar5/SectionF?qapp_id=%s' % qapp_id)

        ctx = {'form': form, 'qapp_id': qapp_id}
        return render(request, self.template_name, ctx)


def get_qar5_for_user(user_id, qapp_id=None):
    """
    Method to get all qapps created by a User.
    """
    user = User.objects.get(id=user_id)
    if qapp_id:
        return Qapp.objects.filter(id=qapp_id)
    return Qapp.objects.filter(prepared_by=user)


def get_qar5_for_team(team_id, qapp_id=None):
    """Method to get all data belonging to a team."""
    team = Team.objects.get(id=team_id)
    include_qapps = QappSharingTeamMap.objects.filter(
        team=team).values_list('qapp', flat=True)

    if qapp_id:
        return Qapp.objects.filter(
            id__in=include_qapps).filter(id=qapp_id).first()

    return Qapp.objects.filter(id__in=include_qapps)


def get_qapp_info(user, qapp_id):
    """Method to return all pieces of a qapp in a dictionary."""
    ctx = {}
    ctx['qapp'] = get_qar5_for_user(user.id, qapp_id)

    # Only return this if the user has access to it via super, owner, or team:
    # db_user = User.objects.get(id=user.id)

    if ctx['qapp'] or user.is_superuser or ctx['qapp'].prepared_by == user:
        ctx['qapp_leads'] = QappLead.objects.filter(qapp_id=qapp_id)
        ctx['qapp_approval'] = QappApproval.objects.filter(
            qapp_id=qapp_id).first()
        if ctx['qapp_approval']:
            ctx['signatures'] = QappApprovalSignature.objects.filter(
                qapp_approval_id=ctx['qapp_approval'].id)
        ctx['section_a'] = SectionA.objects.filter(qapp_id=qapp_id).first()
        ctx['section_b'] = SectionB.objects.filter(qapp_id=qapp_id).all()
        ctx['section_c'] = SectionC()
        ctx['section_d'] = SectionD.objects.filter(qapp_id=qapp_id).first()
        ctx['references'] = References.objects.filter(qapp_id=qapp_id).first()
        ctx['revisions'] = Revision.objects.filter(qapp_id=qapp_id)
        ctx['title'] = str(ctx['qapp'])
        return ctx

    return None
