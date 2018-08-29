from django import forms
from leads.models import OrganizationLeadDetails

class LeadDetailsForm(forms.ModelForm):
    GENDER_CHOICES = (
            ('M', 'Male'),
            ('F', 'Female')
        )

    gender = forms.ChoiceField(choices=GENDER_CHOICES, widget=forms.RadioSelect())
