from django.db import models
from employee.models import Employee
from branch.models import Branch
# Create your models here.


class Task(models.Model):
    task_name = models.CharField(max_length=250)
    action_plan = models.TextField()
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    remarks = models.TextField(null=True)
    financial_year = models.CharField(max_length=10)
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.task_name
