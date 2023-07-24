# forms.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import CharField, ChoiceField, ModelForm, TextInput, \
    Textarea, ModelMultipleChoiceField, SelectMultiple, \
    BooleanField, FileField, ClearableFileInput, HiddenInput, \
    ModelChoiceField, Select, DateTimeField, CheckboxInput
from django.forms.widgets import DateTimeInput, Widget
from django.utils.translation import gettext_lazy as _
from constants.models import QA_CATEGORY_CHOICES, XMURAL_CHOICES
from constants.qapp_builder import SECTION_A_INFO, SECTION_D_INFO, \
    SECTION_E_INFO, SECTION_F_INFO, SECTION_C_INFO
from constants.qapp_builder_sectionb import SECTION_B_INFO
from qapp_builder.models import Division, Qapp, QappApproval, QappLead, \
    QappApprovalSignature, SectionA, SectionB, SectionD, Revision, \
    SectionBType, References, SectionC
from qapp_builder.form_widgets import UswdsCheckboxInput
from teams.models import Team, TeamMembership


class QappForm(ModelForm):
    """Form for creating a new QAPP (Quality Assurance Project Plan)."""

    division = ModelChoiceField(label=_("Division:"),
                                queryset=Division.objects.all(),
                                widget=Select(attrs={
                                    'class': 'form-item__select mt-2 mb-2'}),
                                initial=0)

    division_branch = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                                label=_("Division Branch:"),
                                required=True)

    title = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                      label=_("QAPP Title:"),
                      required=True)

    # Dynamic number of project leads
    # project_leads = inlineformset_factory()

    qa_category = ChoiceField(label=_("QA Category:"),
                              choices=QA_CATEGORY_CHOICES,
                              widget=Select(attrs={
                                  'class': 'form-item__select mt-2 mb-2'}),
                              required=True)

    intra_extra = ChoiceField(label=_("Intra/Extramural:"),
                              choices=XMURAL_CHOICES,
                              widget=Select(attrs={
                                  'class': 'form-item__select mt-2 mb-2'}),
                              required=True)

    revision_number = CharField(label=_("Revision Number:"),
                                required=True,
                                widget=TextInput({'class': 'usa-input mb-2'}))

    date = DateTimeField(label=_("Date:"),
                         required=True,
                         widget=DateTimeInput(
                             attrs={'class': 'usa-input mb-2'}))

    # prepared_by = CharField(
    #     label=_("Prepared By:"), required=True,
    #     widget=TextInput({'class': 'usa-input mb-2',
    #                      'readonly':'readonly'}))

    strap = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                      label=_("StRAP:"),
                      required=True)

    tracking_id = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                            label=_("QA Tracking ID:"),
                            required=True)

    teams = ModelMultipleChoiceField(
        widget=SelectMultiple({
            'class': 'form-item__select mt-2 mb-2',
            'placeholder': 'Teams'
        }),
        queryset=Team.objects.all(),
        label=_("Share With Teams"),
        required=False)

    can_edit = BooleanField(
        required=False,
        label=_("Teams can edit the QAPP"),
        widget=CheckboxInput(attrs={'class': 'form-control mb-2 col-sm-1'}))

    def __init__(self, *args, **kwargs):
        """Override default init to add custom queryset for teams."""
        try:
            current_user = kwargs.pop('user')
            super(QappForm, self).__init__(*args, **kwargs)
            team_ids = TeamMembership.objects.filter(
                member=current_user).values_list('team', flat=True)
            self.fields['teams'].queryset = \
                Team.objects.filter(id__in=team_ids)
            self.fields['teams'].label_from_instance = \
                lambda obj: "%s" % obj.name
        except BaseException:
            super(QappForm, self).__init__(*args, **kwargs)

    class Meta:
        """Meta data for QAPP Form."""

        model = Qapp
        fields = ('division', 'division_branch', 'title', 'qa_category',
                  'intra_extra', 'revision_number', 'date', 'strap',
                  'tracking_id', 'teams', 'can_edit')


class QappLeadForm(ModelForm):
    """Form for creating project leads for a given qapp."""

    name = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                     label=_("Lead Name:"),
                     required=True)

    qapp = ModelChoiceField(queryset=Qapp.objects.all(),
                            initial=0,
                            required=True,
                            label=_("Parent QAPP"),
                            widget=TextInput(attrs={
                                'class': 'usa-input mb-2',
                                'readonly': 'readonly'
                            }))

    class Meta:
        """Meta data for QAPP Form."""

        model = QappLead
        fields = ('name', 'qapp')


class QappApprovalForm(ModelForm):
    """Form for creating the QAPP Approval page."""

    project_plan_title = CharField(
        widget=TextInput({'class': 'usa-input mb-2'}),
        label=_("Project Plan Title"),
        required=True)

    activity_number = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                                label=_("Activity Number"),
                                required=True)

    qapp = ModelChoiceField(queryset=Qapp.objects.all(),
                            required=False,
                            widget=HiddenInput())

    # qapp = ModelChoiceField(queryset=Qapp.objects.all(),
    #                         initial=0,
    #                         required=True,
    #                         label=_("Parent QAPP"),
    #                         widget=TextInput(attrs={
    #                             'class': 'usa-input mb-2',
    #                             'readonly': 'readonly'
    #                         }))

    class Meta:
        """Meta data for QappApproval Form."""

        model = QappApproval
        fields = ('project_plan_title', 'activity_number', 'qapp')


# class CustomCheckboxWidget(CheckboxInput):
#     """Custom Checkbox widget to allow better control for EPA USWDS."""
#     def render(self, name, value, attrs={'class': 'usa-input mb-2'},
#                renderer=None):
#         if not attrs.get('class', None):
#             attrs['class'] = 'usa-input mb-2'
#         widget = super().render(name, value, attrs=attrs,
#                                 renderer=renderer)
#         label = self.attrs.get('label')
#         return ('<div class="usa-checkbox"><label class='
#                 f'"usa-checkbox__label">{label}</label>{widget}</div>')


class QappApprovalSignatureForm(ModelForm):
    """Form for creating the QAPP Approval Signatures."""

    qapp_approval = ModelChoiceField(queryset=QappApproval.objects.all(),
                                     required=False,
                                     widget=HiddenInput())

    name = CharField(widget=TextInput({'class': 'usa-input mb-2'}),
                     label=_("Print Name:"),
                     required=False)

    signature = CharField(label=_("Signature:"),
                          required=False,
                          widget=HiddenInput())

    date = CharField(label=_("Date:"),
                     required=False,
                     widget=HiddenInput())

    # contractor = BooleanField(
    #     required=False,
    #     label=False,
    #     # label=_("Contractor? Default (no check) is EPA."),
    #     widget=UswdsCheckboxInput({'class': 'usa-checkbox__input'}))
    #     # widget=UswdsCheckboxInput())

    # contractor = BooleanField(
    #     required=False,
    #     label=None,
    #     widget=CustomCheckboxWidget({
    #         'label': 'Contractor? Default (no check) is EPA',
    #         'class': 'usa-checkbox__input'
    #     }))

    contractor = BooleanField(
        required=False,
        label=_("Contractor? Default (no check) is EPA."),
        widget=CheckboxInput(
            attrs={'class': 'form-control mb-2 col-sm-1'}))

    # def __init__(self, *args, **kwargs):
    #     """Extending default init so we can wrap boolean input in a div."""
    #     super().__init__(*args, **kwargs)

    #     for field_name, field in self.fields.items():
    #         if field_name == 'contractor':
    #             field.widget = CustomCheckboxWidget(
    #                 # self, field_name, None,
    #                 {'label': 'Contractor? Default (no check) is EPA.'})

    class Meta:
        """Meta data for QappApprovalSignature Form."""

        model = QappApprovalSignature
        fields = ('qapp_approval', 'name', 'signature', 'date', 'contractor')


class SectionAForm(ModelForm):
    """Class representing the rest of Section A (A.3 and later)."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(),
                            initial=0,
                            required=True,
                            label=_("Parent QAPP"),
                            widget=Textarea(attrs={
                                'class': 'usa-input mb-2',
                                'readonly': 'readonly'
                            }))

    # A2 is new, see Jira DAT-32
    a2 = CharField(label=_("A.2 Definitions and Acronyms"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    # Keywords is new, see Jira DAT-35
    a2_keywords = CharField(label=_("Keywords"),
                            required=True,
                            widget=Textarea({'class': 'usa-textarea mb-2'}))

    a3 = CharField(label=_("A.3 Distribution List"),
                   required=False,
                   widget=Textarea({
                       'class': 'usa-textarea mb-2',
                       'readonly': 'readonly'
                   }),
                   initial=SECTION_A_INFO['a3'])

    a4 = CharField(label=_("A.4 Project Task Organization"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    a4_chart = FileField(label=_("Upload Organizational Chart (optional)"),
                         required=False,
                         widget=ClearableFileInput(attrs={
                             'multiple': False,
                             'class': 'custom-file-input mb-2'
                         }))

    a5 = CharField(label=_("A.5 Problem Definition Background"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    a6 = CharField(label=_("A.6 Project Description"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    a7 = CharField(label=_("A.7 Quality Objectives and Criteria"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    a8 = CharField(label=_("A.8 Special Training Certification"),
                   required=True,
                   widget=Textarea({'class': 'usa-textarea mb-2'}))

    a9 = CharField(label=_("A.9 Documents and Records"),
                   required=False,
                   widget=Textarea({
                       'class': 'usa-textarea mb-2',
                       'readonly': 'readonly'
                   }),
                   initial=SECTION_A_INFO['a9'])

    a9_drive_path = CharField(label=_("A.9 Drive Path:"),
                              required=True,
                              widget=TextInput({'class': 'usa-input mb-2'}))

    sectionb_type = ModelMultipleChoiceField(
        widget=SelectMultiple({
            'class': 'form-item__select mt-2 mb-2 section-b-type-input',
            'placeholder': 'Section B Type'
        }),
        queryset=SectionBType.objects.all(),
        label=_("Section B Types"),
        required=True)

    @staticmethod
    def get_help_text():
        return SECTION_A_INFO

    class Meta:
        """Meta data for SectionAForm Form."""

        model = SectionA
        fields = ('qapp', 'a2', 'a2_keywords', 'a3', 'a4', 'a4_chart', 'a5',
                  'a6', 'a7', 'a8', 'a9', 'a9_drive_path', 'sectionb_type')


class SectionBForm(ModelForm):
    """Class representing the entirety of SectionB for a given QAPP."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(),
                            initial=0,
                            required=True,
                            label=_("Parent QAPP"),
                            widget=Select(attrs={
                                'class': 'form-item__select mt-2 mb-2',
                                'readonly': 'readonly'
                            }))

    sectionb_type = ModelChoiceField(
        queryset=SectionBType.objects.all(),
        initial=0,
        required=True,
        label=_("Section B Type"),
        widget=Select(attrs={
            'class': 'form-item__select mt-2 mb-2',
            'readonly': 'readonly'
        }))

    def __init__(self, *args, **kwargs):
        """
        Override method for init to receive dynamic sets of labels.

        This allows us to pass in each Section B type while reusing a single
        form class.
        """
        section_b_info = kwargs.pop('section_b_info', None)
        super(SectionBForm, self).__init__(*args, **kwargs)
        if section_b_info:
            for key, val in section_b_info.items():
                self.fields[key] = CharField(help_text=val['desc'],
                                             label=_(val['label']),
                                             required=False,
                                             widget=Textarea(
                                                 {'class': 'usa-input mb-2'}))

    @staticmethod
    def get_help_text():
        return SECTION_B_INFO

    class Meta:
        """Meta data for SectionBForm Form."""

        model = SectionB
        fields = '__all__'


class SectionCForm(ModelForm):
    """Class representing the rest of Section C."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(), initial=0,
                            required=True, label=_("Parent QAPP"),
                            widget=Textarea(
                                attrs={'class': 'usa-input mb-2',
                                       'readonly': 'readonly'}))

    c1 = CharField(
        label=_("C.1 Assessments and Response Actions"),
        required=False, widget=Textarea({'class': 'usa-textarea mb-2'}),
        initial=SECTION_C_INFO[0])

    c2 = CharField(
        label=_("C.2 Reports to Management"),
        required=False, widget=Textarea({'class': 'usa-textarea mb-2'}),
        initial=SECTION_C_INFO[1])

    @staticmethod
    def get_help_text():
        return SECTION_C_INFO

    class Meta:
        """Meta data for SectionCForm Form."""

        model = SectionC
        fields = ('qapp', 'c1', 'c2')


class SectionDForm(ModelForm):
    """Class representing the entirety of SectionD for a given QAPP."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(), initial=0,
                            required=True, label=_("Parent QAPP"),
                            widget=Textarea(
                                attrs={'class': 'usa-input mb-2',
                                       'readonly': 'readonly'}))

    d1 = CharField(
        label=_("D.1 Data Review, Verification, and Validation"),
        required=True, widget=Textarea({'class': 'usa-textarea mb-2'}))

    d2 = CharField(
        label=_("D.2 Verification and Validation Methods"),
        required=True, widget=Textarea({'class': 'usa-textarea mb-2'}))

    d3 = CharField(
        label=_("D.3 Reconciliation with User Requirements"),
        required=True, widget=Textarea({'class': 'usa-textarea mb-2'}))

    @staticmethod
    def get_help_text():
        return SECTION_D_INFO

    class Meta:
        """Meta data for SectionDForm Form."""

        model = SectionD
        fields = ('qapp', 'd1', 'd2', 'd3')


class ReferencesForm(ModelForm):
    """Form for creating and adding References (Section E) to QAPP."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(), initial=0,
                            required=True, label=_("Parent QAPP"),
                            widget=Textarea(
                                attrs={'class': 'usa-input mb-2',
                                       'readonly': 'readonly'}))
    references = CharField(
        label=_("References"),
        required=True, widget=Textarea({'class': 'usa-textarea mb-2'}))

    @staticmethod
    def get_help_text():
        return SECTION_E_INFO

    class Meta:
        """Meta data for References Form."""

        model = References
        fields = ('qapp', 'references')


class RevisionForm(ModelForm):
    """Form for creating and adding new Revisions (Section F) to QAPP."""

    qapp = ModelChoiceField(queryset=Qapp.objects.all(), initial=0,
                            required=True, label=_("Parent QAPP"),
                            widget=Textarea(
                                attrs={'class': 'usa-input mb-2',
                                       'readonly': 'readonly'}))
    revision = CharField(
        label=_("Revision Number"),
        required=True, widget=TextInput({'class': 'usa-input mb-2'}))

    description = CharField(
        label=_("Description"),
        required=True, widget=TextInput({'class': 'usa-input mb-2'}))

    effective_date = DateTimeField(
        label=_("Effective Date"),
        required=True, widget=DateTimeInput(
            attrs={'class': 'usa-input mb-2'}))

    initial_version = CharField(
        label=_("Initial Version"),
        required=True, widget=TextInput({'class': 'usa-input mb-2'}))

    @staticmethod
    def get_help_text():
        return SECTION_F_INFO

    class Meta:
        """Meta data for Revision Form."""

        model = Revision
        fields = ('qapp', 'revision', 'description',
                  'effective_date', 'initial_version')
