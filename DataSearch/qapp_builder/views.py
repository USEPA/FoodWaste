# views.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of views."""

from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView, ListView
from qapp_builder.forms import QappForm
from qapp_builder.models import Qapp


class QappList(LoginRequiredMixin, ListView):
    """
    Scenario Index View where a user can view existing, edit existing,
    delete existing, and create new calculator scenarios.
    """

    model = Qapp
    template_name = 'qapp_list.html'
    context_object_name = 'qapp_list'

    def get_queryset(self):
        """Get a list of scenarios for the current user."""
        user = self.request.user
        return Qapp.objects.filter(prepared_by=user)


class ScenarioCreate(LoginRequiredMixin, CreateView):
    """Scenario Create view."""

    form_class = QappForm
    template_name = 'scenario/scenario_create.html'

    def get_success_url(self, *args, **kwargs):
        """
        On successful Scenario creation, automatically redirect users
        to the first page in the scenario wizard.
        """
        return reverse_lazy('conditions_create', args=(self.object.id,))


class ScenarioDetail(LoginRequiredMixin, DetailView):
    """Scenario Detail view."""

    model = Qapp
    template_name = 'scenario/scenario_detail.html'
