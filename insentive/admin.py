from django.contrib import admin
from insentive.models import InsentiveAssigned, InsentiveMatrix

class InsentiveMatrixAdmin(admin.ModelAdmin):
    list_display = ['activities', 'target', 'unit', 'weightage_points', 'status']

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(InsentiveMatrixAdmin, self).get_form(request, obj, **kwargs)

class InsentiveAssignedAdmin(admin.ModelAdmin):
    list_display = ['insentive','role','status',]

    list_filter = ['status',]

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(InsentiveAssignedAdmin, self).get_form(request, obj, **kwargs)

# Register your models here.
admin.site.register(InsentiveMatrix,InsentiveMatrixAdmin)
admin.site.register(InsentiveAssigned,InsentiveAssignedAdmin)