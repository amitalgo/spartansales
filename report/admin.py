from django.contrib import admin
from .models import ProductWiseReport,DepartmentWiseReport,ProductContributionCumulative, QuarterlyReport, AchievementYearWise

# Register your models here.
admin.site.register(DepartmentWiseReport)
admin.site.register(ProductWiseReport)
admin.site.register(ProductContributionCumulative)
admin.site.register(QuarterlyReport)
admin.site.register(AchievementYearWise)