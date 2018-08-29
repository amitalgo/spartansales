from django.contrib import admin
from achievement.models import GoalMatrix, Goal, AssignGoal
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
    list_display = ['goal','goal_type',]

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['' ]
        else:
            kwargs['exclude'] = ['status',]
        return super().get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        super().save_model(request, obj, form, change)

admin.site.register(GoalMatrix,GoalMatrixAdmin)
admin.site.register(Goal,GoalAdmin)
admin.site.register(AssignGoal,AssignGoalAdmin)
