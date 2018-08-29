from django.contrib import admin
from branch.models import Branch

class BranchAdmin(admin.ModelAdmin):
    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['created_by', ]
        else:
            kwargs['exclude'] = ['status', 'created_by', ]
        return super(BranchAdmin, self).get_form(request, obj, **kwargs)

# Register your models here.
admin.site.register(Branch,BranchAdmin)