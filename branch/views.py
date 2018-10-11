from django.shortcuts import render
from .models import Branch

from rest_framework import generics

from .serializers import BranchSerializer

# Create your views here.
class BranchListAPIView(generics.ListAPIView):
    serializer_class = BranchSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)
        return Branch.objects.filter(region__company_id=company_id,status=1)