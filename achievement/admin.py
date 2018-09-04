from django.contrib import admin
from achievement.models import GoalMatrix, Goal, AssignGoal
from branch.models import Branch
from employee.models import EmployeeBranch
from achievement.forms import assignGoleForm
from django.db.models import Q

# Register your models here.
class GoalMatrixAdmin(admin.ModelAdmin):
    list_display = ['goal_name','goal_type','status','created_at']

class GoalAdmin(admin.ModelAdmin):
    list_display = ['goal_name', 'parent', 'goal_matrix', 'department', 'product', 'financial_year', 'start_date',
                    'end_date', 'remarks', 'created_by', 'status']

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['created_by', ]
        else:
            kwargs['exclude'] = ['status', 'created_by', ]
        return super(GoalAdmin, self).get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        super().save_model(request, obj, form, change)

class AssignGoalAdmin(admin.ModelAdmin):
    list_display = ['goal','branch','assignTo','status',]
    model = AssignGoal
    # form = assignGoleForm
    # readonly_fields = ['branch']

    # def get_readonly_fields(self,request,obj=None):
    #     # return['branch']

    # Fetch Branch which is assigned to User
    def fetchBranch(self, request):
        branchDet = EmployeeBranch.objects.get(user_id=request.user.id)
        return branchDet.branch.id

    # PreSelect the Foreign Key Value 
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'branch':
            if request.user.is_superuser:
                kwargs['initial'] = Branch.objects.filter()
            else:                
                kwargs['initial'] = Branch.objects.get(pk=self.fetchBranch(request))
        return db_field.formfield(**kwargs)


    # Display status while edit and Not While Adding
    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status',  ]
        return super().get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        super().save_model(request, obj, form, change)

admin.site.register(GoalMatrix,GoalMatrixAdmin)
admin.site.register(Goal,GoalAdmin)
admin.site.register(AssignGoal,AssignGoalAdmin)
