# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse

# import Models
from .models import Department

from rest_framework import generics

from .serializers import DepartmentSerializer

# Create your views here.
class DepartmentListAPIView(generics.ListAPIView):
    serializer_class = DepartmentSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)
        return Department.objects.filter(company=company_id,status=1)
