from django.contrib import admin
from region.models import Region
from country.models import Country
from companies.models import CompaniesUsers, Companies
# Register your models here.

class RegionAdmin(admin.ModelAdmin):
    exclude = ['status', 'created_by','company',]

    # To Store Created By Record
    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.created_by = request.user
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(RegionAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

admin.site.register(Region,RegionAdmin)
