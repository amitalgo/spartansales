from django.db import models
from django.contrib.auth.models import Group

# Create your models here.


class InsentiveMatrix(models.Model):
    activities = models.CharField(max_length=500)
    target = models.IntegerField()
    unit = models.CharField(max_length=100)
    weightage_points = models.IntegerField()
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.activities


class InsentiveAssigned(models.Model):
    insentive = models.ForeignKey(InsentiveMatrix, on_delete=models.CASCADE)
    role = models.ForeignKey(Group,null=True,blank=True,on_delete=models.SET_NULL)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.insentive.activities

