# forms.py (teams)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=R0903
"""
Forms for managing teams.

Available functions:
- Form For Creating or Updating a Project
"""

from django import forms
from django.utils.translation import gettext_lazy as _
from teams.models import Team


class TeamManagementForm(forms.ModelForm):
    """Form For Creating or Updating a Project."""

    # Name of the project
    name = forms.CharField(
        label=_("Name"),
        help_text="Project names must be unique",
        widget=forms.TextInput(attrs={'class': 'usa-input'}),
        required=True)

    class Meta:
        """Meta data for the Team Management Form."""

        model = Team
        fields = ("name", )
