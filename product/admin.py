from django.contrib import admin
from product.models import Product, ProductMedia, ProductPrice, ProductDepartment
import datetime
# Register your models here.

class ProductImagesInline(admin.TabularInline):
    can_delete = False
    model = ProductMedia

class ProductPriceInline(admin.TabularInline):
    model = ProductPrice

class ProductDepartmentInline(admin.StackedInline):
    model = ProductDepartment

class ProductAdmin(admin.ModelAdmin):
    inlines = [
        ProductPriceInline,ProductDepartmentInline,ProductImagesInline,
    ]

    list_display=['product_code','product_name','get_curr_price',]


    def get_curr_price(self,obj):
        curYear = datetime.date.today().year
        proPrice = ProductPrice.objects.get(product=obj.pk,year__year=curYear,status=1)
        return proPrice.price
    get_curr_price.short_description="Current Price"
               
        

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(ProductAdmin, self).get_form(request, obj, **kwargs)

admin.site.register(Product,ProductAdmin)
# admin.site.register(ProductMedia)
