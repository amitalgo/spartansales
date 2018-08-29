from django.contrib import admin,auth
from django.db.models import Q
from leads.models import OrganizationDetails, LeadSource , LeadStatus , LeadStatusType, Department, OrganizationLeadDetails, AssignLeads
from employee.models import EmployeeBranch, Employee
from branch.models import Branch
from leads.forms import LeadDetailsForm
from django.contrib.auth.models import Group, User
# Register your models here.

class LeadSourceAdmin(admin.ModelAdmin):
    list_display = ['source_name','status',]

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(LeadSourceAdmin, self).get_form(request, obj, **kwargs)

class LeadStatusTypeAdmin(admin.ModelAdmin):
    list_display = ['status_type','status',]

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(LeadStatusTypeAdmin, self).get_form(request, obj, **kwargs)

class LeadStatusAdmin(admin.ModelAdmin):

    list_display = ['assignedLead','get_meeting_date','get_organization_name','get_contact_name','get_contact_mobile','get_department','description','remarks','lead_status','get_created_at',]
    list_filter = ('lead_status','assignedLead__lead__department',)

    def get_meeting_date(self,obj):
        return obj.assignedLead.lead.meeting_date
    get_meeting_date.short_description = 'Meeting Date'

    def get_organization_name(self,obj):
        return obj.assignedLead.lead.organisation
    get_organization_name.short_description = 'Organization Name'

    def get_contact_name(self,obj):
        return obj.assignedLead.lead.contact_person
    get_contact_name.short_description = 'Contact Person'

    def get_department(self,obj):
        return obj.assignedLead.lead.department
    get_department.short_description = 'Department'

    def get_contact_mobile(self,obj):
        return obj.assignedLead.lead.mobile
    get_contact_mobile.short_description = 'Contact Mobile'

    def get_lead_status(self,obj):
        return obj.assignedLead.status
    get_lead_status.short_description = 'Lead Status'

    def get_created_at(self,obj):
        return obj.assignedLead.created_at
    get_created_at.short_description = 'Assigned Date'

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(LeadStatusAdmin, self).get_form(request, obj, **kwargs)

    # Fetch Assigned Lead Data to User 
    def get_queryset(self, request):
       qs = super(LeadStatusAdmin,self).get_queryset(request)
       employee_id = Employee.objects.get(user=request.user)
       return qs.filter(assignedLead__assignTo=employee_id)


# class OrganizationLeadInline(admin.TabularInline):
#     can_delete = False
#     model = OrganizationLeadDetails
#     fk_name = 'organisation_id'
#
#     def get_formset(self, request, obj=None, **kwargs):
#         if obj:
#             kwargs['exclude'] = [ 'created_by' ,]
#         else:
#             kwargs['exclude'] = ['status' ,]
#         return super(OrganizationLeadInline, self).get_formset(request, obj, **kwargs)


# class LeadDetailsAdmin(admin.ModelAdmin):
#     can_delete = False
#     list_display = ['first_name',]
#     inlines = [
#         OrganizationLeadInline
#     ]
#
#     def get_form(self, request, obj=None, **kwargs):
#         if obj:
#             kwargs['exclude'] = ['']
#         else:
#             kwargs['exclude'] = ['status', ]
#         return super(LeadDetailsAdmin, self).get_form(request, obj, **kwargs)

class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('department', 'status',)
    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['']
        else:
            kwargs['exclude'] = ['status', ]
        return super(DepartmentAdmin, self).get_form(request, obj, **kwargs)


class OrganizationLeadDetailsAdmin(admin.ModelAdmin):
    list_display = ['contact_person','mobile','organisation','department','lead_source','description','status']
    # form = LeadDetailsForm
 

    # Fetch Lead BranchWise which is assigned to User
    def fetchBranch(self,request):
        branchDet = EmployeeBranch.objects.get(user_id=request.user.id)
        return branchDet.branch

    def get_queryset(self, request):
        qs = super(OrganizationLeadDetailsAdmin, self).get_queryset(request)
        return qs.filter(branch_id=self.fetchBranch(request))

class OrganizationDetailsAdmin(admin.ModelAdmin):
    list_display = ['first_name','last_name','organisation_name','email','website','address']

class AssignLeadsAdmin(admin.ModelAdmin):
    model = AssignLeads

    list_display= ['lead', 'assignTo', 'get_lead_status','get_lead_desc','get_lead_remarks' ,'status','created_at', ]

    exclude = ['status',]

    
  


    def get_lead_status(self,obj):
        leadstatus = LeadStatus.objects.get(assignedLead_id=obj.pk)
        return leadstatus.lead_status

    def get_lead_remarks(self,obj):
        leadremarks = LeadStatus.objects.get(assignedLead_id=obj.pk)
        return leadremarks.remarks

    def get_lead_desc(self,obj):
        leadDesc = LeadStatus.objects.get(assignedLead_id=obj.pk)
        return leadDesc.description
    
    def fetch_current_lead(self,obj):
        leadDesc = AssignLeads.objects.get(pk=obj.pk)
        return lead

    # Disable Edit Link
    # def get_list_display_links(self, request, list_display):

    #     check_lead_status = AssignLeads.objects.get(pk=self.id)

    #     if(check_lead_status.status==False):
    #         return (None,)
    #     else:
    #         return self.list_display_links

    def linklead(self, obj):
        p = AssignLeads.objects.get(pk=obj.pk)
        return p.id
        
    # Disable Edit Link
    # def get_list_display_links(self, request, list_display):
    #     print(self.linklead)
    #     leadobj = AssignLeads.objects.get(pk=62)
    #     st = leadobj.status
    #     if st:
    #         return ['lead'] 
    #     else:
    #         return None

    # Add readonly attribute in djano admin for Lead while Editing
    def get_readonly_fields(self,request,obj=None):
        if obj:
            return ['lead']
        return self.readonly_fields

    # Fetch Branch which is assigned to User
    def fetchBranch(self, request):
        branchDet = EmployeeBranch.objects.get(user_id=request.user.id)
        return branchDet.branch

    childrenarr=[]
    # Fetch Child Role Under Parent Role in Self Table
    def getChildren(self, request,childObj,childrenarr):
        if not childObj:
            user = auth.get_user(request)
            group_id = user.groups.values_list('id',flat=True).first()
        else: 
            group_id = childObj

        childGroup = Group.objects.filter(parent = group_id, parent__isnull=False)
        for child in childGroup:
            childrenarr.append(child.id)
            self.getChildren(request,child.id,childrenarr)
        data = User.objects.filter(groups__in = childrenarr).values_list('id',flat=True)        
        return data

    # Filter Foreign Key Value
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'lead':
            # Condition to check is logged in User is Admin or
            if request.user.is_superuser:
                pass
            else:
                kwargs['queryset'] = OrganizationLeadDetails.objects.filter(branch_id=self.fetchBranch(request))

        if db_field.name == 'assignTo':
            if request.user.is_superuser:
                pass
            else:
                childObj = False
                childrenarr =[]
                kwargs['queryset'] =  EmployeeBranch.objects.filter(~Q(user_id = request.user),branch_id=self.fetchBranch(request),user_id__in = self.getChildren(request,childObj,childrenarr))      
                   
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

admin.site.register(OrganizationLeadDetails,OrganizationLeadDetailsAdmin)
admin.site.register(OrganizationDetails,OrganizationDetailsAdmin)   
admin.site.register(LeadSource,LeadSourceAdmin)
admin.site.register(AssignLeads, AssignLeadsAdmin)
admin.site.register(LeadStatus,LeadStatusAdmin)
admin.site.register(LeadStatusType,LeadStatusTypeAdmin)
admin.site.register(Department, DepartmentAdmin)

