from django.db import models
from  django.contrib.auth.models import User
from branch.models import Branch
from country.models import Country
from region.models import Region

# Changing Groups Name To Role
from django.contrib.auth.models import Group
# from django.utils.translation import ugettext_lazy as _
# Create your models here.

# class Role(Group):
#     class Meta:
#         proxy = True
#         app_label = 'auth'
#         verbose_name = _('Role')
#END

# Adding Extra Field to Group Model
Group.add_to_class('parent',models.ForeignKey(Group,null=True,blank=True,related_name='children',on_delete=models.SET_NULL))




class Employee(models.Model):
    user = models.OneToOneField(User,blank=False,null=True, on_delete=models.CASCADE)
    mobile = models.CharField(max_length=251)
    gender_choice = (
        ('male', 'Male'),
        ('female', 'Female'),
    )
    gender = models.CharField(max_length=7, choices=gender_choice,)
    photo = models.FileField(upload_to='image/employee/profile/')
    address = models.TextField()
    # status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_by = models.ForeignKey(User, related_name='creator_id', on_delete=models.CASCADE,blank=False,default=None)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.user.first_name + ' ' + self.user.last_name
    def display_ss(self):
        return self.user.first_name

class EmployeeReport(models.Model):
    employee = models.ForeignKey(Employee, null=True ,on_delete=models.CASCADE)
    report_to = models.ForeignKey(Employee, related_name="employee_reportTo_id", on_delete=models.CASCADE)
    status = models.IntegerField(default=1, help_text='Active/Inactive', choices=((1, 'Active'), (0, 'Inactive'),))
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.employee.user.first_name

class EmployeeBranch(models.Model):
    # employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
    employee = models.OneToOneField(Employee, on_delete=models.CASCADE, blank=False, default=None)
    user = models.OneToOneField(User, on_delete=models.CASCADE, blank=False, default=None)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
       return self.user.first_name+' '+self.user.last_name+' -- '+(','.join([g.name for g in self.user.groups.all()]) if self.user.groups.count() else 'Admin')
      


class EmployeeMedia(models.Model):
    employee = models.ForeignKey(Employee,on_delete=models.CASCADE)
    mediaType = models.CharField(max_length=50,choices=(('video', 'Video'),('image','Image'),('ppt','PPT'),('doc','DOC'),))
    mediaUrl = models.TextField()
    activityType = models.CharField(max_length=200,choices=(('testimonial','Testimonial'),('equipment','Equipment'),('competitor','Competitor'),))









