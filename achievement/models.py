from django.db import models
from leads.models import Department
from product.models import Product
from employee.models import Employee
from region.models import Region
from branch.models import  Branch
from  django.contrib.auth.models import User
# Create your models here.


class GoalMatrix(models.Model):
    goal_name = models.CharField(max_length=250)
    target = models.FloatField(null=True)
    goal_type = models.CharField(max_length=20,help_text='Type', choices=(('amount', 'Amount'), ('unit', 'Unit'),))
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal_name

class Goal(models.Model):
    goal_name = models.CharField(max_length=300, blank=True, null=True)
    parent = models.ForeignKey('self',null=True,blank=True ,on_delete=models.CASCADE)
    target = models.FloatField(null=True)
    goal_matrix = models.ForeignKey(GoalMatrix, on_delete=models.CASCADE)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    financial_year = models.CharField(max_length=10)
    start_date = models.DateField()
    end_date = models.DateField()
    remarks = models.TextField()
    created_by = models.ForeignKey(User,blank=False,null=True, on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal_name

class AssignGoal(models.Model):
    goal = models.ForeignKey(Goal, on_delete=models.CASCADE)
    goal_type = models.CharField(max_length=250)
    assignTo = models.ForeignKey(Employee, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    # region = models.ForeignKey(Region, on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal_type






