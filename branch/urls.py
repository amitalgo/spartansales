from django.conf.urls import url, include
from django.contrib import admin
from . import views

urlpatterns = [

    # Branch Api
    url(r'^fetchActiveBranch/$',views.BranchListAPIView.as_view(),name="branch"),
]
