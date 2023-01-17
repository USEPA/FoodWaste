# forms.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=R0903
"""
Forms for managing projects.

Available functions:
- Form For Creating or Updating a Project
"""

from django import forms
from django.utils.translation import gettext_lazy as _
from projects.models import Branch, CenterOffice, Division, Office, \
    OrdRap, Project
from teams.models import Team, User, TeamMembership


class OrdRapForm(forms.ModelForm):
    """Form for creating or modifying ORD RAP objects."""

    name = forms.CharField(
        label=_("Name"),
        widget=forms.TextInput(attrs={'class': 'usa-input'}),
        required=True)

    class Meta:
        """Meta data for the OrdRap Form."""

        model = OrdRap
        fields = ("name", )


class ProjectForm(forms.ModelForm):
    """Form For Creating or Updating a Project."""

    # Title/Name of the project
    title = forms.CharField(
        label=_("Title"),
        widget=forms.TextInput(attrs={'class': 'usa-input'}),
        required=True)

    project_lead = forms.ModelChoiceField(
        label=_("Project Lead"),
        queryset=User.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    office = forms.ModelChoiceField(
        label=_("Office"),
        queryset=Office.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    center_office = forms.ModelChoiceField(
        label=_("Center/Office"),
        queryset=CenterOffice.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    division = forms.ModelChoiceField(
        label=_("Division"),
        queryset=Division.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    branch = forms.ModelChoiceField(
        label=_("Branch"),
        queryset=Branch.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    ord_rap = forms.ModelChoiceField(
        label=_("ORD RAP"),
        queryset=OrdRap.objects.all(),
        widget=forms.Select(attrs={'class': 'usa-input usa-select'}),
        required=True)

    # TODO: Need to make sure this is saving properly and populating properly
    #       when editing an existing project instance (i.e. shared teams
    #       should already be selected and non-shared teams should not be).
    # Team Members (List of teams related to this project)
    teams = forms.ModelMultipleChoiceField(
        widget=forms.SelectMultiple({
            'class': 'usa-input mb-2',
            'placeholder': 'Teams'
        }),
        queryset=Team.objects.all(),
        label=_("Share With Teams"),
        required=False)

    can_edit = forms.BooleanField(
        required=False,
        label=_("Teams can edit the QAPP"),
        widget=forms.CheckboxInput(
            attrs={'class': 'form-control col-sm-1 mb-2'}))

    def __init__(self, *args, **kwargs):
        """Override default init to add custom queryset for teams."""
        try:
            current_user = kwargs.pop('user', None)
            can_edit = kwargs.pop('can_edit', None)
            kwargs.update(initial={'can_edit': can_edit})
            super(ProjectForm, self).__init__(*args, **kwargs)
            # TODO: Clarify that this is the desired functionality. Will a
            #       user ever want to share a project with a non-member Team?
            # team_ids = TeamMembership.objects.filter(
            #     member=current_user).values_list('team', flat=True)
            # self.fields['teams'].queryset = \
            #     Team.objects.filter(id__in=team_ids)
            # self.fields['teams'].label_from_instance = \
            #     lambda obj: "%s" % obj.name
        except Exception:
            super(ProjectForm, self).__init__(*args, **kwargs)

    class Meta:
        """Meta data for the Project Management Form."""

        model = Project
        fields = ('title', 'project_lead', 'office', 'center_office',
                  'division', 'branch', 'ord_rap', 'teams', 'can_edit')
