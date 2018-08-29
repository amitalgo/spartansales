from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Employee, EmployeeBranch, EmployeeReport
from django.contrib.auth.models import User,Group


# Changing Groups Name To Role
from django.contrib.auth.admin import GroupAdmin
from django.contrib.auth.models import Group
# from .models import Role

# admin.site.unregister(Group)
# admin.site.register(Role, GroupAdmin)
# End

class BranchInline(admin.TabularInline):
    can_delete = False
    model = EmployeeBranch

class EmployeeInine(admin.StackedInline):
    model = Employee
    can_delete = False
    fk_name = 'user'

    def get_formset(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = [ 'created_by' ,]
        else:
            kwargs['exclude'] = ['status' ,  'created_by',]
        return super(EmployeeInine, self).get_formset(request, obj, **kwargs)

class CustomUserAdmin(UserAdmin):
    inlines  = [EmployeeInine, BranchInline ]
    model = User

    list_display = ['first_name','email','get_groups','get_branch',]

    # Displaying Group Name in Display List
    def get_groups(self, obj):
        return ','.join([g.name for g in obj.groups.all()]) if obj.groups.count() else 'Admin'

    get_groups.short_description = 'Group'

    # Fetch User Branch using user id
    def fetchBranch(self,request):
        branchDet = EmployeeBranch.objects.get(user_id=request.id)
        return branchDet.branch

    def get_branch(self,obj):
        return self.fetchBranch(obj)
    get_branch.short_description = 'Branch'


    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.created_by = request.user
            instance.save()
        formset.save_m2m()

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

class EmployeeReportAdmin(admin.ModelAdmin):
    list_display = ['employee','report_to','status',]

    list_filter = ['status',]

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(EmployeeReportAdmin, self).get_form(request, obj, **kwargs)

admin.site.register(EmployeeReport,EmployeeReportAdmin)
