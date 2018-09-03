from django import forms
from achievement.models import AssignGoal  
class assignGoleForm(forms.ModelForm):
    class Meta:
        model = AssignGoal
        fields = ['branch','assignTo',]    

    def __init__(self, *args, **kwargs):
        super(assignGoleForm, self).__init__(*args, **kwargs)
        self.fields['assignTo'].widget.attrs.update({'class': 'input-calss_name'})
