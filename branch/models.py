from django.db import models
from region.models import Region
# Create your models here.


class Branch(models.Model):
    region = models.ForeignKey(Region, on_delete=models.CASCADE)
    branch_name = models.CharField(max_length=250)
    branch_address = models.TextField()
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.branch_name

    class Meta:
        verbose_name_plural='branch'
