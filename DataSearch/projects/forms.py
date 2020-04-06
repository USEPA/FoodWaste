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
from django.utils.translation import ugettext_lazy as _
from projects.models import Branch, CenterOffice, Division, Office, \
    OrdRap, Project
from teams.models import Team


class OrdRapForm(forms.ModelForm):
    """TODO"""
    
    name = forms.CharField(
        label=_("Name"),
        widget=forms.TextInput(
            attrs={'class': 'form-control'}), required=True)

    class Meta:
        """Meta data for the OrdRap Form."""

        model = OrdRap
        fields = ("name",)


class ProjectForm(forms.ModelForm):
    """Form For Creating or Updating a Project."""

    # Title/Name of the project
    title = forms.CharField(
        label=_("Title"), help_text="Project names must be unique",
        widget=forms.TextInput(
            attrs={'class': 'form-control'}), required=True)
    office = forms.ModelChoiceField(
        label=_("Office"), queryset=Office.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
    center_office = forms.ModelChoiceField(
        label=_("Center/Office"), queryset=CenterOffice.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
    division = forms.ModelChoiceField(
        label=_("Division"), queryset=Division.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
    branch = forms.ModelChoiceField(
        label=_("Branch"), queryset=Branch.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
    # Team Members (List of teams related to this project)
    teams = forms.ModelMultipleChoiceField(
        widget=forms.SelectMultiple(
            {'class': 'form-control mb-2', 'placeholder': 'Teams'}),
        queryset=Team.objects.all(),
        label=_("Share With Teams"), required=False)
    ord_rap = forms.ModelChoiceField(
        label=_("ORD RAP"), queryset=OrdRap.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'}), required=True)

    def __init__(self, *args, **kwargs):
        """Override default init to add custom queryset for teams."""
        try:
            current_user = kwargs.pop('user')
            super(ProjectForm, self).__init__(*args, **kwargs)
            team_ids = TeamMembership.objects.filter(
                member=current_user).values_list('team', flat=True)
            self.fields['teams'].queryset = \
                Team.objects.filter(id__in=team_ids)
            self.fields['teams'].label_from_instance = \
                lambda obj: "%s" % obj.name
        except:
            super(ProjectForm, self).__init__(*args, **kwargs)

    class Meta:
        """Meta data for the Project Management Form."""

        model = Project
        fields = ('title', 'office', 'center_office', 'division',
                  'branch', 'teams', 'ord_rap',)


#class OfficeForm(forms.ModelForm):
#    """TODO"""
    
#    name = forms.CharField(
#        label=_("Name"), help_text="Office names must be unique",
#        widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=True)
#    weblink = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    description = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)


#class CenterOfficeForm(forms.ModelForm):
#    """TODO"""
    
#    name = forms.CharField(
#        label=_("Name"), help_text="Center/Office names must be unique",
#        widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=True)
#    weblink = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    description = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    office = forms.ModelChoiceField(
#        label=_("Office"), queryset=Office.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)


#class DivisionForm(forms.ModelForm):
#    """TODO"""
    
#    name = forms.CharField(
#        label=_("Name"), help_text="Division names must be unique",
#        widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=True)
#    weblink = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    description = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    office = forms.ModelChoiceField(
#        label=_("Office"), queryset=Office.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
#    center_office = forms.ModelChoiceField(
#        label=_("Center/Office"), queryset=CenterOffice.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)


#class BranchForm(forms.ModelForm):
#    """TODO"""
    
#    name = forms.CharField(
#        label=_("Name"), help_text="Branch names must be unique",
#        widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=True)
#    weblink = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    description = forms.CharField(
#        label=_("Name"), widget=forms.TextInput(
#            attrs={'class': 'form-control'}), required=False)
#    office = forms.ModelChoiceField(
#        label=_("Office"), queryset=Office.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
#    center_office = forms.ModelChoiceField(
#        label=_("Center/Office"), queryset=CenterOffice.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
#    division = forms.ModelChoiceField(
#        label=_("Division"), queryset=Division.objects.all(),
#        widget=forms.Select(attrs={'class': 'form-control'}), required=True)
