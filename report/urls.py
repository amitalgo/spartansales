"""spartansales URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from . import views

urlpatterns = [
    url(r'^department/$',views.DepartmentView.as_view(),name="department_report_view"),
    url(r'^product/$',views.ProductView.as_view(),name="product_report_view"),
    url(r'^department/fetchGraphDataforReport/$',views.DepartmentListAPIView.as_view(),name="department_report"),
    url(r'^product/fetchGraphDataforReport/$',views.ProductListAPIView.as_view(),name="product_report"),
    url(r'^productCumulative/fetchGraphDataforReport/$',views.ProductCumulativeListAPIView.as_view(),name="product_cumulative_report"),
    url(r'^quarterReport/fetchGraphDataforReport/$',views.QuarterListAPIView.as_view(),name="quarter_report"),
    url(r'^achievementYear/fetchGraphDataforReport/$',views.AchievementYearWiseListAPIView.as_view(),name="achievement_year")
]
