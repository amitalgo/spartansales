from django.contrib import admin
from country.models import Country
from region.models import Region
# Register your models here.

class RegionInline(admin.TabularInline):
    model = Region
    can_delete = False
    fk_name = 'country'

    def re(self):
        return 'hie'

    def get_formset(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = [ 'created_by' ,]
        else:
            kwargs['exclude'] = ['status' ,  'created_by',]
        return super(RegionInline, self).get_formset(request, obj, **kwargs)

reg = Region()

class CountryAdmin(admin.ModelAdmin):
    list_display = ('country','created_by',)

    def country(self, obj):
        return obj.country_name

    list_filter = ('country_name', 'status', )

    exclude = ['status','created_by']

    inlines = [
        RegionInline
    ]

    def save_model(self, request, obj, form, change):
        obj.created_by = request.user
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.created_by = request.user
            instance.save()
        form.save_m2m()

admin.site.register(Country,CountryAdmin)


