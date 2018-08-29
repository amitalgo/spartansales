from django.db import models
from django.contrib.auth.models import User
from employee.models import Employee
# Create your models here.


class Role(models.Model):
    role_name = models.CharField(max_length=260)
    status = models.IntegerField(default=1)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)


class RolePrivillage(models.Model):
    role_privillage = models.OneToOneField(Role, on_delete=models.CASCADE)
    permission = models.TextField()
    status = models.IntegerField(default=1)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)


class EmployeeRole(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    privillage = models.ForeignKey(RolePrivillage, on_delete=models.CASCADE)
    status = models.IntegerField(default=1)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)

