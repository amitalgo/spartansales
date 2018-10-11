from django.contrib import admin
from achievement.models import GoalMatrix, Goal, AssignGoal
from branch.models import Branch
from employee.models import EmployeeBranch
from achievement.forms import assignGoleForm
from leads.models import Department
from django.db.models import Q

# Register your models here.
class GoalMatrixAdmin(admin.ModelAdmin):
    list_display = ['goal_name','goal_type','status','created_at']

    # To Store Created By Record
    def save_model(self, request, obj, form, change):
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status', 'company',]
        return super(GoalMatrixAdmin, self).get_form(request, obj, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(GoalMatrixAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

class GoalAdmin(admin.ModelAdmin):
    list_display = ['goal_name', 'parent', 'goal_matrix', 'department', 'product', 'financial_year', 'start_date',
                    'end_date', 'remarks', 'created_by', 'status']

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['created_by', 'company',]
        else:
            kwargs['exclude'] = ['status', 'created_by', 'company',]
        return super(GoalAdmin, self).get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.company_id=request.user.companiesusers.company.id
        super().save_model(request, obj, form, change)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(GoalAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

    # Filter Foreign Key Value
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        company_id = request.user.companiesusers.company.id
        if db_field.name == 'goal_matrix':
            kwargs['queryset'] = GoalMatrix.objects.filter(company=company_id)

        if db_field.name == 'department':
            kwargs['queryset'] = Department.objects.filter(company=company_id)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class AssignGoalAdmin(admin.ModelAdmin):
    list_display = ['goal','branch','assignTo','status',]
    model = AssignGoal

    # Fetch Branch which is assigned to User
    def fetchBranch(self, request):
        branchDet = EmployeeBranch.objects.get(user_id=request.user.id)
        return branchDet.branch.id

    # PreSelect the Foreign Key Value 
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'goal':
            company_id = request.user.companiesusers.company.id
            kwargs['queryset'] = Goal.objects.filter(goal_matrix__company_id=company_id)

        if db_field.name == 'branch':
            if request.user.is_superuser:
                company_id = request.user.companiesusers.company.id
                kwargs['queryset'] = Branch.objects.filter(region__company_id=company_id)
            else:
                company_id = request.user.companiesusers.company.id
                kwargs['queryset'] = Branch.objects.get(region__company_id=company_id,pk=self.fetchBranch(request))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)


    # Display status while edit and Not While Adding
    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status', 'company', ]
        return super().get_form(request, obj, **kwargs)

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.company_id = request.user.companiesusers.company.id
        super().save_model(request, obj, form, change)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(AssignGoalAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

admin.site.register(GoalMatrix,GoalMatrixAdmin)
admin.site.register(Goal,GoalAdmin)
admin.site.register(AssignGoal,AssignGoalAdmin)
