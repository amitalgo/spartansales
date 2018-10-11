from django.contrib import admin,auth
from django.db.models import Q
from leads.models import OrganizationDetails, LeadSource , LeadStatus , LeadStatusType, Department, OrganizationLeadDetails, AssignLeads
from employee.models import EmployeeBranch, Employee
from branch.models import Branch
from leads.forms import LeadDetailsForm
from django.contrib.auth.models import Group, User
from django.utils.html import format_html
from companies.models import Companies

class LeadSourceAdmin(admin.ModelAdmin):
    list_display = ['source_name','status',]

    # To Store Company Record
    def save_model(self, request, obj, form, change):
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status','company', ]
        return super(LeadSourceAdmin, self).get_form(request, obj, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(LeadSourceAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

class LeadStatusTypeAdmin(admin.ModelAdmin):
    list_display = ['get_status_type','status',]
    list_display_links = None
    editable_objs = [1,]

    # To Store Company Id Record
    def save_model(self, request, obj, form, change):
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    # Make Some field not editable where is_editable=0
    def get_status_type(self,obj):        
        if obj.isEditable in self.editable_objs:
            return format_html("<b><a href='{id}'>{status_type}</a></b>",id=obj.id, status_type=obj.status_type,)
        else:
            return format_html("{status_type}",id=obj.id, status_type=obj.status_type,)

    # to remove save button and delete button on Add
    def add_view(self, request, form_url='', extra_context=None):
        editable = True

        more_context = {
            # set a context var telling our customized template to suppress the Save button group
            'my_editable': editable,
        }
        more_context.update(extra_context or {})
        return super().add_view(request, form_url, more_context)

    # to remove save button and delete button on Edit Form
    def change_view(self, request, object_id, form_url='', extra_context=None):
        obj = LeadStatusType.objects.get(pk=object_id)
        editable = obj.isEditable

        if not editable and request.method == 'POST':
            return HttpResponseForbidden("Cannot change an inactive MyModel")

        more_context = {
            # set a context var telling our customized template to suppress the Save button group
            'my_editable': editable,
        }
        more_context.update(extra_context or {})
        return super().change_view(request, object_id, form_url, more_context)

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['isEditable','company',]
        else:
            kwargs['exclude'] = ['status','isEditable','company',]
        return super(LeadStatusTypeAdmin, self).get_form(request, obj, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(LeadStatusTypeAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

class LeadStatusAdmin(admin.ModelAdmin):

    list_display = ['assignedLead','get_meeting_date','get_organization_name','get_contact_name','get_contact_mobile','get_department','description','remarks','lead_status','get_created_at',]
    # list_filter = ('lead_status','assignedLead__lead__department',)

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
       employee_id = Employee.objects.get(user=request.user)
       qs = super(LeadStatusAdmin,self).get_queryset(request)
       if request.user.is_superuser:
           return qs.filter(assignedLead__lead__organisation__company=company_id,assignedLead__assignTo=employee_id)
       else:
           employee_id = Employee.objects.get(user=request.user)
           company_id = request.user.companiesusers.company.id
           return qs.filter(assignedLead__assignTo=employee_id,assignedLead__status=1,assignedLead__lead__organisation__company=company_id)

    # Filter Foreign Key Value
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
       company_id = request.user.companiesusers.company.id
       if db_field.name == 'assignedLead':
           kwargs['queryset'] = AssignLeads.objects.filter(lead__organisation__company=company_id)
       return super().formfield_for_foreignkey(db_field, request, **kwargs)

class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('department', 'status',)

    # To Store Company Records
    def save_model(self, request, obj, form, change):
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(DepartmentAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status', 'company',]
        return super(DepartmentAdmin, self).get_form(request, obj, **kwargs)


class OrganizationLeadDetailsAdmin(admin.ModelAdmin):
    list_display = ['lead_title','contact_person','mobile','organisation','department','lead_source','description','get_branch','status']

    # fetch branch of lead
    def get_branch(self,obj):
        return obj.branch.branch_name
    get_branch.short_description="Branch"

    # Fetch Lead BranchWise which is assigned to User
    def fetchBranch(self,request):
        branchDet = EmployeeBranch.objects.get(user_id=request.user.id)
        return branchDet.branch

    # Save Company Id of Logged In User
    def save_model(self, request, obj, form, change):
        obj.company_id = request.user.companiesusers.company.id
        super().save_model(request, obj, form, change)

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status','company',]
        return super(OrganizationLeadDetailsAdmin, self).get_form(request, obj, **kwargs)

    # Fetch Leads By Branchwise
    def get_queryset(self, request):    
        qs = super(OrganizationLeadDetailsAdmin, self).get_queryset(request)
        # Condition to disable for admin for fetching lead details
        if not request.user.is_superuser:
            return qs.filter(branch_id=self.fetchBranch(request))
        else:
            company_id = request.user.companiesusers.company.id
            return qs.filter(company_id=company_id)

    # Filter Foreign Key Value
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        company_id = request.user.companiesusers.company.id
        if db_field.name == 'organisation':
            kwargs['queryset'] = OrganizationDetails.objects.filter(company_id=company_id)
        if db_field.name == 'department':
            kwargs['queryset'] = Department.objects.filter(company_id=company_id)
        if db_field.name == 'branch':
            kwargs['queryset'] = Branch.objects.filter(region__company_id=company_id)

        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class OrganizationDetailsAdmin(admin.ModelAdmin):
    list_display = ['first_name','last_name','organisation_name','email','website','address']

    # To Store Company Record
    def save_model(self, request, obj, form, change):
        obj.company = request.user.companiesusers.company
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.company = request.user.companiesusers.company
            instance.save()
        form.save_m2m()

    def get_form(self, request, obj=None, **kwargs):
        if obj:
            kwargs['exclude'] = ['company',]
        else:
            kwargs['exclude'] = ['status','company',]
        return super(OrganizationDetailsAdmin, self).get_form(request, obj, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(OrganizationDetailsAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(company_id=company_id)

class AssignLeadsAdmin(admin.ModelAdmin):
    model = AssignLeads

    list_display= ['get_lead', 'assignTo', 'get_lead_status','get_lead_desc','get_lead_remarks' ,'status','created_at', ]
    list_display_links = None
    exclude = ['status',]

    # disable edit link from list where status is inactive
    def get_lead(self,obj):
        if obj.status:
            return format_html("<b><a href='{id}'>{lead}</a></b>",id=obj.id, lead=obj.lead,)
        else:
            return format_html("{lead}",id=obj.id, lead=obj.lead,)

    # to remove save button and delete button on Add
    def add_view(self, request, form_url='', extra_context=None):
        editable = True

        more_context = {
            # set a context var telling our customized template to suppress the Save button group
            'my_editable': editable,
        }
        more_context.update(extra_context or {})
        return super().add_view(request, form_url, more_context)

    # to remove save button and delete button      
    def change_view(self, request, object_id, form_url='', extra_context=None):
        obj = AssignLeads.objects.get(pk=object_id)
        editable = obj.status

        if not editable and request.method == 'POST':
            return HttpResponseForbidden("Cannot change an inactive MyModel")

        more_context = {
            # set a context var telling our customized template to suppress the Save button group
            'my_editable': editable,
        }
        more_context.update(extra_context or {})
        return super().change_view(request, object_id, form_url, more_context)

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

    def linklead(self, obj):
        p = AssignLeads.objects.get(pk=obj.pk)
        return p.id

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
        company_id = request.user.companiesusers.company.id
        if db_field.name == 'lead':
            # Condition to check is logged in User is Admin or
            if request.user.is_superuser:
                kwargs['queryset'] = OrganizationLeadDetails.objects.filter(organisation__company_id=company_id)
            else:
                kwargs['queryset'] = OrganizationLeadDetails.objects.filter(organisation__company_id=company_id,branch_id=self.fetchBranch(request))

        if db_field.name == 'assignTo':
            if request.user.is_superuser:
                kwargs['queryset'] = Employee.objects.filter(~Q(user_id = request.user),user__companiesusers__company=company_id)
            else:
                childObj = False
                childrenarr =[]
                # kwargs['queryset'] =  Employee.objects.filter(~Q(user_id = request.user),user__companiesusers__company=company_id,employeebranch__branch_id=self.fetchBranch(request),user_id__in = self.getChildren(request,childObj,childrenarr))
                kwargs['queryset'] = Employee.objects.filter(~Q(user_id=request.user),user__companiesusers__company=company_id,user_id__in = self.getChildren(request,childObj,childrenarr))
                   
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    # Filter List by User Company Id
    def get_queryset(self, request):
        qs = super(AssignLeadsAdmin, self).get_queryset(request)
        company_id = request.user.companiesusers.company.id
        return qs.filter(lead__organisation__company_id=company_id)

admin.site.register(OrganizationLeadDetails,OrganizationLeadDetailsAdmin)
admin.site.register(OrganizationDetails,OrganizationDetailsAdmin)   
admin.site.register(LeadSource,LeadSourceAdmin)
admin.site.register(AssignLeads, AssignLeadsAdmin)
admin.site.register(LeadStatus,LeadStatusAdmin)
admin.site.register(LeadStatusType,LeadStatusTypeAdmin)
admin.site.register(Department, DepartmentAdmin)

