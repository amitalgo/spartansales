# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse

# import Models
from .models import Department

from rest_framework import generics

from .serializers import DepartmentSerializer

from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response
# Create your views here.
class DepartmentListAPIView(generics.ListAPIView):
    serializer_class = DepartmentSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)
        return Department.objects.filter(company=company_id,status=1)

class DashboardAPIView(generics.ListAPIView):
    def get(self,request, *args, **kwargs):



        return Response({
            "status": "True",
            "type": 'success',
            "message": 'Fetch Data SuccessFully',
            'data': 'ok '
            # json.loads(rr.replace("\'", '"'))
        }, status=HTTP_200_OK)