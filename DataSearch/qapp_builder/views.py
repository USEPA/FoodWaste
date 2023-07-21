# views.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of views."""

from typing import Any, Dict
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView, ListView
from qapp_builder.forms import QappForm, QappApprovalForm, \
    QappApprovalSignatureForm
from qapp_builder.models import Qapp
from qapp_builder.utils import get_steps


def get_qapp_status(qapp):
    ctx = {}
    return ctx


class WizardCreatePartial(LoginRequiredMixin, CreateView):
    """Custom partial class to contain constant pieces of other classes."""

    def get_context_data(self, *args, **kwargs):
        """Override default context to return the proper qapp step."""
        ctx = super().get_context_data(*args, **kwargs)
        ctx['page_title'] = self.page_title
        ctx['step_num'] = getattr(self, 'step_num', None)

        # Inside here do the formatting
        # ctx['defaults'] = self.form_class.get_defaults(year='2018')
        # you can use self.form_class to get the form class, then .fields

        ctx['qapp_id'] = self.kwargs.get('pk', None)
        ctx = get_steps(ctx, ctx.get('step_num', None))
        return ctx

    def form_valid(self, form):
        """Override default form validator to add qapp_id"""
        obj = form.save(commit=False)
        obj.qapp_id = self.kwargs.get('pk', None)
        return super(WizardCreatePartial, self).form_valid(form)

    def get_success_url(self, *args, **kwargs):
        """
        On successful Scenario creation, automatically redirect users
        to the next page in the qapp wizard.
        """
        return reverse_lazy(self.next_url, args=(self.object.id,))


class QappList(LoginRequiredMixin, ListView):
    """
    QAPP Index View where a user can view existing, edit existing,
    delete existing, and create new calculator qapps.
    """

    model = Qapp
    template_name = 'qapp_list.html'
    context_object_name = 'qapp_list'

    def get_queryset(self):
        """Get a list of qapps for the current user."""
        user = self.request.user
        return Qapp.objects.filter(prepared_by=user)


class QappDetail(LoginRequiredMixin, DetailView):
    """QAPP Detail view."""

    model = Qapp
    template_name = 'qapp_summary.html'

    def get_context_data(self, *args, **kwargs: Any) -> Dict[str, Any]:
        ctx = super().get_context_data(*args, **kwargs)
        ctx['status'] = get_qapp_status(ctx['object'])
        ctx['page_title'] = 'QAPP Details'
        ctx['qapp_id'] = self.kwargs['pk']
        ctx = get_steps(ctx, ctx.get('step_num', None))
        return ctx


class QappCreate(WizardCreatePartial):
    """QAPP Create view."""

    form_class = QappForm
    template_name = '_generic_inputs_create.html'
    page_title = 'QAPP'
    next_url = 'approval_create'


class ApprovalCreate(WizardCreatePartial):
    """QAPP Approval Create view."""

    form_class = QappApprovalForm
    template_name = '_generic_inputs_create.html'
    page_title = 'Approval'
    next_url = 'qapp_summary'


class ApprovalSignatureCreate(WizardCreatePartial):
    """View to add a new Signature to the QAPP Approval page."""

    form_class = QappApprovalSignatureForm
    template_name = '_generic_inputs_create.html'
    page_title = 'Approval Signature'
    next_url = 'qapp_summary'
