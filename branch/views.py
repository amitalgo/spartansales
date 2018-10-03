from django.shortcuts import render
from .models import Branch

from rest_framework import generics

from .serializers import BranchSerializer

# Create your views here.
class BranchListAPIView(generics.ListAPIView):
    queryset = Branch.objects.filter(status=1)
    serializer_class = BranchSerializer