from django.forms.widgets import CheckboxInput


class UswdsCheckboxInput(CheckboxInput):

    template_name = 'widgets/uswds_checkbox.html'
