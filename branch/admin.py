from django.contrib import admin
from branch.models import Branch
from region.models import Region

class BranchAdmin(admin.ModelAdmin):

    list_display=['branch_name','get_region',]

    def get_region(self,obj):
        return obj.region.region_name
    get_region.short_description = 'Region'

    # Filter Region Dropdown to fetch logged In user Company
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'region':
            company_id = request.user.companiesusers.company.id
            kwargs['queryset'] = Region.objects.filter(company=company_id)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['created_by', ]
        else:
            kwargs['exclude'] = ['status', 'created_by', ]
        return super(BranchAdmin, self).get_form(request, obj, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(BranchAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(region__company_id=company_id)

# Register your models here.
admin.site.register(Branch,BranchAdmin)