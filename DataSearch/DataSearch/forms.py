# forms.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0613,E1101,R0903,W0611,C0411
"""Definition of forms."""

from django.forms import ModelMultipleChoiceField as MultiChoice
from django.forms import CharField, ModelForm, TextInput, \
    Textarea, SelectMultiple, \
    BooleanField, RadioSelect, FileField, ClearableFileInput, \
    ModelChoiceField, Select
from django.utils.translation import gettext_lazy as _
from constants.models import YES_OR_NO
from DataSearch.models import ExistingData, ExistingDataSource
from teams.models import TeamMembership, Team


class ExistingDataForm(ModelForm):
    """Form for creating a new Existing Data Tracking instance."""

    teams = MultiChoice(queryset=Team.objects.none(),
                        label=_("Share With Teams"),
                        required=False,
                        widget=SelectMultiple({
                            'class': 'form-item__select',
                            'placeholder': 'Teams'
                        }))

    work = CharField(max_length=255,
                     widget=TextInput({
                         'class': 'usa-input',
                         'placeholder': 'Work Office/Lab'
                     }),
                     label=_("User Work Office/Lab"),
                     required=True)

    email = CharField(max_length=255,
                      widget=TextInput({
                          'class': 'usa-input',
                          'placeholder': 'Email'
                      }),
                      label=_("Email Address"),
                      required=True)

    phone = CharField(max_length=32,
                      widget=TextInput({
                          'class': 'usa-input',
                          'placeholder': '(555) 555-5555 or 555-555-5555'
                      }),
                      label=_("Phone Number"),
                      required=True)

    search = CharField(max_length=255,
                       widget=TextInput({
                           'class': 'usa-input',
                           'placeholder': 'Search Term'
                       }),
                       label=_("Search for Existing Data"),
                       required=True)

    source = ModelChoiceField(label=_("Source"),
                              queryset=ExistingDataSource.objects.all(),
                              widget=Select(
                                  attrs={'class': 'form-item__select'}),
                              initial=0)

    source_title = CharField(max_length=255,
                             widget=TextInput({
                                 'class': 'usa-input',
                                 'placeholder': 'Source Title'
                             }),
                             label=_("Source Title"),
                             required=True)

    keywords = CharField(max_length=1024,
                         widget=Textarea({
                             'rows': 2,
                             'class': 'usa-input',
                             'placeholder': 'Keywords, Comma Seperated'
                         }),
                         label=_("Keywords"),
                         required=False)

    url = CharField(max_length=255,
                    widget=TextInput({
                        'class': 'usa-input',
                        'placeholder': 'https://www.epa.gov/'
                    }),
                    label=_("Source URL Link"),
                    required=True)

    disclaimer_req = BooleanField(label=_("EPA Discaimer Required"),
                                  required=False,
                                  initial=False,
                                  widget=RadioSelect(choices=YES_OR_NO))

    citation = CharField(max_length=2048,
                         widget=Textarea({
                             'rows': 3,
                             'class': 'usa-input',
                             'placeholder': 'Citation'
                         }),
                         label=_("Citation"),
                         required=True)

    comments = CharField(max_length=2048,
                         widget=Textarea({
                             'rows': 3,
                             'class': 'usa-input',
                             'placeholder': 'Comments'
                         }),
                         label=_("Comments"),
                         required=False)

    attachments = FileField(
        label=_("Upload File Attachments"),
        required=False,
        widget=ClearableFileInput(attrs={
            'multiple': False,
            'class': 'usa-file-input'
        }))

    def __init__(self, *args, **kwargs):
        """Override default init to add custom queryset for teams."""
        try:
            current_user = kwargs.pop('user')
            super(ExistingDataForm, self).__init__(*args, **kwargs)
            team_ids = TeamMembership.objects.filter(
                member=current_user).values_list('team', flat=True)
            self.fields['teams'].queryset = Team.objects.filter(
                id__in=team_ids)
            self.fields['teams'].label_from_instance = \
                lambda obj: "%s" % obj.name
            # If this is an edit form, i.e. instance is passed in, then
            # we need to set the default selected teams, if any...
            instance = kwargs.get('instance', None)
            if instance:
                sel_teams = instance.teams.all()
                if sel_teams:
                    self.fields['teams'].initial = sel_teams
        except BaseException:
            super(ExistingDataForm, self).__init__(*args, **kwargs)

    class Meta:
        """Meta data for Existing Data Tracking."""

        model = ExistingData
        fields = ('work', 'email', 'phone', 'search', 'source', 'source_title',
                  'keywords', 'url', 'citation', 'comments')
