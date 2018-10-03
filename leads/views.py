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
    queryset = Department.objects.filter(status=1)
    serializer_class = DepartmentSerializer
