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
from django.contrib import admin

from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls.static import static
from rest_framework.documentation import include_docs_urls

admin.site.site_title = "Spartan Sales Management"
admin.site.site_header = "Spartan Sales Management"

urlpatterns = [
    url('', admin.site.urls),
    url(r'^chaining/', include('smart_selects.urls')),
    url(r'^product/',include('product.urls')),
    # url(r'^report/',include('report.urls')),

# For Api
    url(r'^docs/', include_docs_urls(title='Spartan Sales Docs')),
    # Login
    url(r'^api/',include('employee.urls',namespace="login")),
    # Dashboard
    url(r'^api/',include('leads.urls',namespace="dashboard")),
    # Department
    url(r'^department/',include('leads.urls',namespace="leads")),
    # Branch
    url(r'^branch/',include('branch.urls',namespace="branch")),
    # Product
    url(r'^product/',include('product.urls',namespace="product")),
    # Report
    url(r'^report/',include('report.urls',namespace="report")),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()