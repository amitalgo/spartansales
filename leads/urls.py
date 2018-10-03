from django.conf.urls import url, include
from django.contrib import admin
from . import views

urlpatterns = [

    # Department Api
    url(r'^fetchActiveDepartment/$',views.DepartmentListAPIView.as_view(),name="department"),
]
