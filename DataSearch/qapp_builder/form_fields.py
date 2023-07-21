from django.forms.fields import BooleanField
from qapp_builder.form_widgets import UswdsCheckboxInput


class UswdsBooleanField(BooleanField):

    widget = UswdsCheckboxInput
