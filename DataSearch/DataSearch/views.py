# views.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=C0301,E1101,R0901,W0613,W0622,C0411


"""Definition of views."""

from datetime import datetime
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.http import HttpRequest, HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView, ListView, CreateView, \
    DetailView, UpdateView, DeleteView
from constants.utils import download_file, download_files
from DataSearch.forms import ExistingDataForm
from DataSearch.models import ExistingData, ExistingDataSharingTeamMap, \
    Attachment, DataAttachmentMap
from qapp_builder.models import SectionA
from teams.models import Team, TeamMembership


@login_required
@staff_member_required
def web_dev_tools(request, *args, **kwargs):
    """
    Go to the web developer page with custom admin functionality.

    - Includes various custom admin functionality.
    - Includes button to remove extra new line characters/spaces from QAPP data
    """
    return render(request, 'web_dev.html', {})


@login_required
@staff_member_required
def clean_qapps(request, *args, **kwargs):
    """
    Clean QAPP Data.

    - Remove extra new line characters and spaces.
    - Convert QA_Category to the proper value.
    """
    # TODO: Fix all default data of all sections of all qapps
    sections_a = SectionA.objects.all()
    for sect in sections_a:
        # Clean Section A
        a3_clean = sect.a3.replace('\r\n', ' ').replace('    ', ' ')
        a9_clean = sect.a9.replace('\r\n', ' ').replace('    ', ' ')
        a9_clean = a9_clean.replace('QA QA', 'QA')
        if 'B' in sect.qapp.qa_category:
            a9_clean = a9_clean.replace('QA Category A', sect.qapp.qa_category)
        else:
            a9_clean = a9_clean.replace('QA Category B', sect.qapp.qa_category)
        sect.a3 = a3_clean
        sect.a9 = a9_clean
        sect.save()
    return render(request, 'web_dev.html', {})


def get_existing_data_all():
    """Get all data regardless of user or team."""
    return ExistingData.objects.all()


def get_existing_data_user(user_id):
    """Get all Existing Data created by a User."""
    user = User.objects.get(id=user_id)
    return ExistingData.objects.filter(created_by=user)


def get_existing_data_team(team_id):
    """Get all data belonging to a team."""
    team = Team.objects.filter(id=team_id).first()
    if team:
        include_data = ExistingDataSharingTeamMap.objects.filter(
            team=team).values_list('data', flat=True)
        queryset = ExistingData.objects.filter(id__in=include_data)
        return queryset
    return []


def check_can_edit(data, user):
    """
    Check if the provided user can edit the provided Data Search instance.

    All of the user's member teams are checked as well as the user's
    super user status or Data Search instance ownership status.
    """
    # Check if any of the user's teams have edit privilege:
    user_teams = TeamMembership.objects.filter(
        member=user).values_list('team', flat=True)

    for team in user_teams:
        data_team_map = ExistingDataSharingTeamMap.objects.filter(
            data=data, team=team).first()
        if data_team_map and data_team_map.can_edit:
            return True

    # Check if the user is super or owns the data:
    return user.is_superuser or data.created_by == user


class ExistingDataIndex(LoginRequiredMixin, TemplateView):
    """Return the first page of the Existing Data flow."""

    template_name = 'DataSearch/existing_data_index.html'

    def get_context_data(self, **kwargs):
        """
        Override method to send data to the template.

        - Specifically, want to send a list of users and teams to select from.
        """
        context = super().get_context_data(**kwargs)
        context['users'] = User.objects.all()
        context['teams'] = Team.objects.all()
        return context


class ExistingDataList(LoginRequiredMixin, ListView):
    """View for Existing Data Tracking Tool."""

    model = ExistingData
    context_object_name = 'existing_data_list'
    template_name = 'DataSearch/existing_data_list.html'

    def get_context_data(self, **kwargs):
        """
        Override method to send data to the template.

        - Specifically, send the user or team information for this list of data
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
        """Get a list Existing Data objects based on user or team ID."""
        path = self.request.path.split('/')
        p_id = path[len(path) - 1]
        p_type = path[len(path) - 2]
        if p_type == 'user':
            return get_existing_data_user(p_id)
        if p_type == 'team':
            return get_existing_data_team(p_id)
        return get_existing_data_all()


class ExistingDataDetail(LoginRequiredMixin, DetailView):
    """View for viewing the details of a Existing data instance."""

    model = ExistingData
    template_name = 'DataSearch/existing_data_detail.html'

    def get_context_data(self, **kwargs):
        """
        Override method to send data to the template.

        - Send the user or team information for this list of data.
        """
        context = super().get_context_data(**kwargs)
        context['edit_disabled'] = ''
        if not check_can_edit(context['object'], self.request.user):
            context['edit_message'] = 'You cannot edit this data.'
            context['edit_disabled'] = 'disabled'

        referer = self.request.META.get('HTTP_REFERER', None)
        if referer:
            referer = referer.split('/')
            p_id = referer[len(referer) - 1]
            p_type = referer[len(referer) - 2]
            if p_type == 'user':
                context['p_user'] = User.objects.get(id=p_id)
            elif p_type == 'team':
                context['team'] = Team.objects.get(id=p_id)

        return context


class ExistingDataEdit(LoginRequiredMixin, UpdateView):
    """View for editing the details of a Existing data instance."""

    model = ExistingData
    form_class = ExistingDataForm
    template_name = 'DataSearch/existing_data_edit.html'

    def get(self, request, *args, **kwargs):
        """
        GET method for the ExistingData Edit View.

        Override default get request so we can verify the user has
        edit privileges, either through super status or team membership.
        """
        pk = kwargs.get('pk')
        object = ExistingData.objects.filter(id=pk).first()
        if check_can_edit(object, request.user):
            return render(request, self.template_name,
                          {'object': object,
                           'form': self.form_class(instance=object,
                                                   user=request.user)})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect('/existingdata/', 401, reason)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a modified Existing Data form."""
        pk = kwargs.get('pk')
        instance = ExistingData.objects.filter(id=pk).first()
        if check_can_edit(instance, request.user):
            form = ExistingDataForm(request.POST, request.FILES,
                                    instance=instance, user=request.user)
            if form.is_valid():
                obj = existing_form_process_teams_attachments(
                    request, form, instance)
                return HttpResponseRedirect('/existingdata/detail/%s' % obj.id)

            return render(request, self.template_name, {'form': form})

        reason = 'You cannot edit this data.'
        return HttpResponseRedirect('/existingdata/', 401, reason)


def existing_form_process_teams_attachments(request, form, instance=None):
    """
    Process forms for existing Teams' Attachments.

    Custom method with shared code when saving an Existing Data instance.
    Assume form.is_valid() check passed outside this method.
    """
    obj = form.save(commit=False)
    obj.created_by = request.user
    obj.disclaimer_req = form.cleaned_data['disclaimer_req']
    obj.save()
    for field in request.FILES:
        file = request.FILES[field]
        # filename = fs.save(file.name, file).
        # uploaded_file_url = fs.url(filename).
        # Insert the attachment.
        attch = Attachment()
        attch.uploaded_by = request.user
        attch.name = file.name
        attch.file = file
        attch.save()
        # Insert DataAttachmentMap.
        attch_map = DataAttachmentMap()
        attch_map.data = obj
        attch_map.attachment = attch
        attch_map.save()

    # Prepare and insert teams data.
    teams = form.cleaned_data['teams']
    existing_teams = []
    # Get any existing teams mapped to this existing_data instance
    if instance:
        existing_teams = instance.teams.all()
        for team in existing_teams:
            if team not in teams:
                data_team_map = ExistingDataSharingTeamMap.objects.filter(
                    data=instance, team=team).first()
                if data_team_map:
                    data_team_map.delete()

    for team in teams:
        if not existing_teams or team not in existing_teams:
            data_team_map = ExistingDataSharingTeamMap()
            data_team_map.can_edit = True
            data_team_map.team = team
            data_team_map.data = obj
            data_team_map.save()

    return obj


class ExistingDataCreate(LoginRequiredMixin, CreateView):
    """Class for creating new Existing Data."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form to creating a new Existing Data."""
        return render(request, "DataSearch/existing_data_create.html",
                      {'form': ExistingDataForm(user=request.user)})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new completed Existing Data form."""
        form = ExistingDataForm(request.POST, request.FILES, user=request.user)
        if form.is_valid():
            obj = existing_form_process_teams_attachments(request, form, None)
            return HttpResponseRedirect('/existingdata/detail/%s' % obj.id)
        return render(request, 'DataSearch/existing_data_create.html',
                      {'form': form})


class ExistingDataDelete(LoginRequiredMixin, DeleteView):
    """Class for deleting previously uploaded files."""

    model = ExistingData
    template_name = 'DataSearch/existing_data_confirm_delete.html'
    success_url = reverse_lazy('tracking_tool')

    def dispatch(self, *args, **kwargs):
        """."""
        pk = kwargs.get('pk')
        instance = ExistingData.objects.filter(id=pk).first()
        if instance:
            user = self.request.user
            if check_can_edit(instance, user) or user.is_superuser:
                return super().dispatch(*args, **kwargs)
        return HttpResponseRedirect(self.success_url)


def home(request):
    """Render the home page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'index.html',
        {
            'title': 'Home Page',
            'year': datetime.now().year,
        }
    )


def contact(request):
    """Render the contact page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'main/contact.html',
        {
            'title': 'Contact',
            'year': datetime.now().year,
        }
    )


def attachments_download(request, *args, **kwargs):
    """
    Download attachments for a provided existing data search.

    - pk for existing data (required)
    - id for attachment (optional)
    """
    existing_id = kwargs.get('pk', None)
    attachment_id = kwargs.get('id', None)
    existing = ExistingData.objects.filter(id=existing_id).first()

    if existing:
        if attachment_id is None:
            # Export all uploads for this user:
            file_list = existing.attachments.all()
            zip_name = 'existingdata_%s_attachments' % existing_id
            return download_files(file_list, zip_name)

        else:
            # Export the upload specified, if it belongs to the user:
            file = existing.attachments.filter(id=attachment_id).first()
            if file:
                return download_file(file)

    return HttpResponse(request)


def attachment_delete(request, *args, **kwargs):
    """
    Delete an attachment for a provided existing data search.

    - pk for existing data (required)
    - id for attachment (required)
    """
    existing_id = kwargs.get('pk', None)
    attachment_id = kwargs.get('id', None)
    existing = ExistingData.objects.filter(id=existing_id).first()

    if existing and check_can_edit(existing, request.user):
        file = existing.attachments.filter(id=attachment_id).first()
        if file:
            file.delete()
            existing.save()

    return HttpResponseRedirect('/existingdata/detail/%s' % existing_id)
