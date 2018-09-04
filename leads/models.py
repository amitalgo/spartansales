from django.db import models
from django.contrib.auth.models import User
from employee.models import EmployeeBranch
from django import forms
# from organisation.models import Organisation
from django.forms import widgets
from django.db.models import Q
from branch.models import Branch
from region.models import Region
from product.models import Product
from employee.models import Employee
from smart_selects.db_fields import ChainedForeignKey

# Create your models here.
class LeadSource(models.Model):
    source_name = models.CharField(max_length=250)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.source_name

class Department(models.Model):
    department = models.CharField(max_length=250)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.department

class LeadStatusType(models.Model):
    status_type = models.CharField(max_length=250)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    isEditable = models.BooleanField(default=1)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.status_type

    class Meta:
        verbose_name_plural = 'Status Type'

class OrganizationDetails(models.Model):
    first_name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    organisation_name = models.CharField(max_length=250)
    phone = models.CharField(max_length=20, null=True)
    mobile = models.CharField(max_length=20, null=True)
    fax = models.CharField(max_length=20, null=True)
    email = models.CharField(max_length=250, null=True)
    address = models.TextField(null=True)
    website = models.CharField(max_length=500, null=True)
    description = models.TextField(null=True)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.organisation_name

    class Meta:
        verbose_name_plural = 'Organization Details'

class OrganizationLeadDetails(models.Model):
    contact_person = models.CharField(max_length=250,null=True)
    mobile = models.CharField(max_length=20,null=True)
    email = models.CharField(max_length=250, null=True,blank=True)
    organisation = models.ForeignKey(OrganizationDetails, on_delete=models.CASCADE)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    lead_title = models.CharField(max_length=250, null=True,blank=True)
    lead_source = models.ForeignKey(LeadSource, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    # product = ChainedForeignKey(Product,chained_field="department",null=True,chained_model_field="department",show_all=False,auto_choose=True,sort=True)
    product = models.ForeignKey(Product,blank=True,null=True,on_delete=models.CASCADE)
    convert = models.IntegerField(default=0)
    discount = models.FloatField(blank=True,null=True)
    description = models.TextField(null=True,blank=True)
    meeting_date = models.DateField(null=True,blank=True)
    lead_closed_date = models.DateField(null=True,blank=True)
    selling_price = models.FloatField(null=True,blank=True)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.lead_title

    class Meta:
        verbose_name_plural='Lead Details'

class AssignLeads(models.Model):
    lead = models.ForeignKey(OrganizationLeadDetails,on_delete=models.CASCADE)
    assignTo = models.ForeignKey(Employee,on_delete=models.CASCADE)
    remarks = models.TextField(null=True)
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.lead.lead_title    

    # Override the Save Function and Store the Assigned Leads to LeadStatus Model
    def save(self, *args, **kwargs):
        if self.pk:
            assignlead = AssignLeads.objects.filter(lead=self.lead,assignTo=self.assignTo,status=True)
            if len(assignlead) < 1:
            # if assignlead.assignTo != self.assignTo or assignlead.lead != self.lead:
                updatelead =  AssignLeads.objects.filter(lead=self.lead)
                updatelead.update(status=False)
                self.pk=None
                super(AssignLeads,self).save(force_insert=True, force_update=False,*args,**kwargs)
                commit = True
            else:
                commit=False
                super(AssignLeads,self).save(force_insert=False, force_update=True,*args,**kwargs)
        else:
            commit = True
            super(AssignLeads,self).save(*args,**kwargs)

        if commit:
            parent = AssignLeads.objects.get(pk=self.id)
            children = parent.leadstatus_set.create()      

    class Meta:
        verbose_name_plural = 'Assign Leads'

class LeadStatus(models.Model):
    assignedLead = models.ForeignKey(AssignLeads, null=True ,on_delete=models.CASCADE)
    lead_status = models.ForeignKey(LeadStatusType,null=True, on_delete=models.CASCADE)
    remarks = models.TextField(null=True)
    description = models.TextField(null=True)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.assignedLead.lead.lead_title

    class Meta:
        verbose_name_plural = 'My Lead Status'

class ReasonType(models.Model):
    reason = models.CharField(max_length=250,null=True)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)

class OrderLost(models.Model):
    lead = models.ForeignKey(OrganizationLeadDetails,on_delete=models.CASCADE)
    reasontye = models.ForeignKey(ReasonType,on_delete=models.CASCADE)
    remarks = models.TextField(null=True)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)







