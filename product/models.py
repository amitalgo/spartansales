from django.db import models

# Create your models here.

class Product(models.Model):
    product_name = models.CharField(max_length=250)
    parent = models.ForeignKey('self', null=True,blank=True ,on_delete=models.CASCADE)
    product_code = models.CharField(max_length=250)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.product_name

class ProductPrice(models.Model):
    product = models.ForeignKey(Product,on_delete=models.CASCADE)
    price = models.FloatField()
    year = models.DateField()
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.product.product_name

class ProductDepartment(models.Model):
    product = models.ForeignKey(Product,null=True,on_delete=models.CASCADE)
    department = models.ForeignKey("leads.department",null=True,on_delete=models.CASCADE)  
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.product.product_name

class ProductMedia(models.Model):
    photo = models.FileField(null=True , blank=True,upload_to='image/product/')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.product.product_name

