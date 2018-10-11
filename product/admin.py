from django.contrib import admin
from product.models import Product, ProductMedia, ProductPrice, ProductDepartment
from leads.models import Department
import datetime
# Register your models here.

class ProductImagesInline(admin.TabularInline):
    can_delete = False
    model = ProductMedia

class ProductPriceInline(admin.TabularInline):
    model = ProductPrice
    can_delete = False

    def get_formset(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = [ '' ,]
        else:
            kwargs['exclude'] = ['status' , ]
        return super(ProductPriceInline, self).get_formset(request, obj, **kwargs)

class ProductDepartmentInline(admin.StackedInline):
    model = ProductDepartment

    # Filter Foreign Key Value
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        company_id = request.user.companiesusers.company.id
        if db_field.name == 'department':
            kwargs['queryset'] = Department.objects.filter(company_id=company_id)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def get_formset(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = [ '' ,]
        else:
            kwargs['exclude'] = ['status' , ]
        return super(ProductDepartmentInline, self).get_formset(request, obj, **kwargs)

class ProductAdmin(admin.ModelAdmin):
    inlines = [
        ProductPriceInline,ProductDepartmentInline,ProductImagesInline,
    ]

    list_display=['product_name','product_code','get_curr_price',]

    def get_curr_price(self,obj):
        curYear = datetime.date.today().year
        proPrice = ProductPrice.objects.get(product=obj.pk,year__year=curYear,status=1)
        return proPrice.price
    get_curr_price.short_description="Current Price"

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status', 'company',]
        return super(ProductAdmin, self).get_form(request, obj, **kwargs)

    # Filter Region Dropdown to fetch logged In user Company
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'parent':
            company_id = request.user.companiesusers.company.id
            kwargs['queryset'] = Product.objects.filter(company=company_id)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

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

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(ProductAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

admin.site.register(Product,ProductAdmin)
# admin.site.register(ProductMedia)
