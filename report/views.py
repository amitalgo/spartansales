from django.shortcuts import render
from django.http import HttpResponse
from branch.models import Branch
from django.db.models import Count
from django.http import HttpResponse
from django.db.models import Sum
from django.db import connection
from django.views.generic.base import TemplateView
from product.models import Product

# models
from leads.models import OrganizationLeadDetails

from rest_framework import generics
from .serializers import DepartmentSerializer, ProductSerializer, ProductCumulativeSerializer, QuarterSerializer, AchievementYearWiseSerializer

# Create your views here.
class DepartmentView(TemplateView):
    template_name = "admin/report/index.html"

class ProductView(TemplateView):
    template_name = "admin/report/product.html"

class DepartmentListAPIView(generics.ListAPIView):

    serializer_class = DepartmentSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)

        if company_id:

            departmentID = self.request.query_params.get('departmentID')

            branchID = self.request.query_params.get('branchID')

            productId = self.request.query_params.get('productID')

            startDate = self.request.query_params.get('start_date')

            endDate = self.request.query_params.get('end_date')

            query =  "select old.ID as id,(select department from leads_department where id=old.department_id) as department_name,sum(old.selling_price) as achieved,(select sum(target) from achievement_goal where department_id=old.department_id ) as target from leads_organizationleaddetails as old join leads_organizationdetails as od on od.id=old.organisation_id where old.convert=1 and old.company_id="+company_id

            list = []

            if departmentID:
                list.append("old.department_id=" + departmentID)

            if branchID:
                list.append("old.branch_id=" + branchID)

            if productId:
                list.append("old.product_id=" + productId)

            if startDate and endDate:
                list.append("(old.lead_closed_date BETWEEN '"+startDate+ "' AND '" + endDate+"')")

            if departmentID or branchID or productId or (startDate and endDate):
                query += " and "+" and ".join(str(x) for x in list )

            return OrganizationLeadDetails.objects.raw(query+ " group by old.department_id")

class ProductListAPIView(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):

        company_id=self.request.META.get('HTTP_COMPANY_ID',None)

        if company_id:
            departmentID = self.request.query_params.get('departmentID')

            branchID = self.request.query_params.get('branchID')

            productId = self.request.query_params.get('productID')

            startDate = self.request.query_params.get('start_date')

            endDate = self.request.query_params.get('end_date')

            selling = []
            average = []

            if departmentID:
                selling.append("old.department_id=" + departmentID)
                average.append("department_id=" + departmentID)

            if branchID:
                selling.append("old.branch_id=" + branchID)
                average.append("branch_id="+ branchID)

            if productId:
                selling.append("old.product_id in (" + productId + ")")
                average.append("product_id in (" + productId + ")")

            if startDate and endDate:
                selling.append("(old.lead_closed_date BETWEEN '"+startDate+ "' AND '" + endDate+"')")

            query = "select p.id,p.product_name,AVG(old.selling_price) as achieved_price,(select pp.price*(select count(*) from leads_organizationleaddetails where product_id=old.product_id"

            if departmentID or branchID or productId:
                query += " and " +" and ".join(str(x) for x in average)

            query += ")/(select count(*) from leads_organizationleaddetails where product_id=old.product_id"

            if departmentID or branchID or productId:
                query += " and " +" and ".join(str(x) for x in average)

            query += ") from product_productprice as pp where pp.product_id=old.product_id and pp.status=1 order by pp.id asc limit 1) as average_price from product_product as p left join leads_organizationleaddetails as old on old.product_id=p.id where old.status=1 and old.convert=1 and old.company_id="+company_id

            if departmentID or branchID or productId or (startDate and endDate):
                query += " and " +" and ".join(str(x) for x in selling)

            return OrganizationLeadDetails.objects.raw(query+ " group by old.product_id")

class ProductCumulativeListAPIView(generics.ListAPIView):
    serializer_class = ProductCumulativeSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)

        if company_id:
            query = "select p.id,(select product_name from product_product where id=(IFNULL(p.parent_id,p.id))) as product_name,IFNULL(p.parent_id,p.id) as parent,TRUNCATE((sum(selling_price)*100/(select sum(selling_price) from leads_organizationleaddetails where company_id="+company_id+")),2) as sp from product_product as p left JOIN leads_organizationleaddetails as old on old.product_id=p.id join leads_organizationdetails as od on od.id=old.organisation_id where od.company_id="+company_id+" group by parent"

            return OrganizationLeadDetails.objects.raw(query)


class QuarterListAPIView(generics.ListAPIView):
    serializer_class = QuarterSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)

        if company_id:

            quarter = self.request.query_params.get('quarter')

            query = "SELECT old.id,MONTHNAME(old.lead_closed_date) as month,(select sum(target) from achievement_goal where company_id="+company_id+" and MONTH(old.lead_closed_date) BETWEEN MONTH(start_date) and MONTH(end_date) ) as target,sum(old.selling_price) as achieved FROM `leads_organizationleaddetails` as old join leads_organizationdetails as od on od.id=old.organisation_id where old.convert=1 and od.company_id="+company_id

            if quarter == "1":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 1 and 3)"
            elif quarter == "2":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 4 and 6)"
            elif quarter == "3":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 7 and 9)"
            elif quarter == "4":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 10 and 12)"
            else:
                query += " "

            return OrganizationLeadDetails.objects.raw(query + "group by MONTH(old.lead_closed_date)")


class AchievementYearWiseListAPIView(generics.ListAPIView):
    serializer_class = AchievementYearWiseSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)
        if company_id:
            quarter = self.request.query_params.get('quarter')

            query = "SELECT old.id,MONTHNAME(old.lead_closed_date) as month,(select sum(selling_price) from leads_organizationleaddetails where MONTH(lead_closed_date)=MONTH(old.lead_closed_date) and YEAR(lead_closed_date) = YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR))) as prev,sum(old.selling_price) as curr FROM `leads_organizationleaddetails` as old join leads_organizationdetails as od on od.id=old.organisation_id where od.company_id="+ company_id +" and old.convert=1 and YEAR(old.lead_closed_date) = YEAR(CURDATE())"

            if quarter == "1":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 1 and 3)"
            elif quarter == "2":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 4 and 6)"
            elif quarter == "3":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 7 and 9)"
            elif quarter == "4":
                query += " and (MONTH(old.lead_closed_date) BETWEEN 10 and 12) "
            else:
                query += " "

            return OrganizationLeadDetails.objects.raw(query + "group by MONTH(old.lead_closed_date)")

