from django import forms
from achievement.models import AssignGoal  
from employee.models import EmployeeBranch
class assignGoleForm(forms.ModelForm):
    class Meta:
        model=AssignGoal
        fields = ('assignTo','branch','goal',)

    def __init__(self, *args, **kwargs):
        super(assignGoleForm, self).__init__(*args, **kwargs)
        try:            
            self.fields['assignTo'].queryset=EmployeeBranch.objects.get(user=5)
        except EmployeeBranch.DoesNotExist:
            ### there is not userextend corresponding to this user, do what you want 
            pass