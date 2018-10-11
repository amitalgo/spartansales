from django.db import models
from leads.models import Department
from product.models import Product
from employee.models import Employee,EmployeeBranch
from region.models import Region
from branch.models import  Branch
from  django.contrib.auth.models import User
from smart_selects.db_fields import ChainedForeignKey
from companies.models import Companies
# Create your models here.

class GoalMatrix(models.Model):
    goal_name = models.CharField(max_length=250)
    target = models.FloatField(null=True)
    goal_type = models.CharField(max_length=20,help_text='Type', choices=(('amount', 'Amount'), ('unit', 'Unit'),))
    company = models.ForeignKey(Companies, null=True, blank=False, on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal_name

class Goal(models.Model):
    goal_matrix = models.ForeignKey(GoalMatrix, on_delete=models.CASCADE)
    goal_name = models.CharField(max_length=300, blank=True, null=True)
    parent = models.ForeignKey('self',null=True,blank=True ,on_delete=models.CASCADE)
    target = models.FloatField(null=True)    
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    financial_year = models.CharField(max_length=10)
    start_date = models.DateField()
    end_date = models.DateField()
    remarks = models.TextField()
    company = models.ForeignKey(Companies, null=True, blank=False, on_delete=models.CASCADE)
    created_by = models.ForeignKey(User,blank=False,null=True, on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal_name

class AssignGoal(models.Model):
    goal = models.ForeignKey(Goal, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    assignTo = ChainedForeignKey(EmployeeBranch,chained_field="branch",related_name="fetch_assign",null=True,chained_model_field="branch",show_all=False,auto_choose=True,sort=True)
    company = models.ForeignKey(Companies, null=True, blank=False, on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.goal.goal_name






