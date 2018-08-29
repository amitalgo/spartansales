from django.db import models
from country.models import Country
from django.contrib.auth.models import User
# Create your models here.


class Region(models.Model):
    region_name = models.CharField(max_length=250)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    parent = models.ForeignKey('self',blank=True, null=True, related_name="children",on_delete=models.SET_NULL)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, blank=False, default=None)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.region_name

    class Meta:
        verbose_name_plural='Regions'