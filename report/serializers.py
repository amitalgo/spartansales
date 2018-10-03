from leads.models import OrganizationLeadDetails
from product.models import Product

from rest_framework import serializers

class DepartmentSerializer(serializers.ModelSerializer):
    achieved = serializers.IntegerField()
    target = serializers.IntegerField()
    department_name= serializers.CharField(read_only=True, source="department.department")

    class Meta:
        model = OrganizationLeadDetails
        fields = ['achieved','target','department_name',]


class ProductSerializer(serializers.ModelSerializer):
    achieved_price = serializers.IntegerField()
    average_price = serializers.IntegerField()

    class Meta:
        model = Product
        fields = ['achieved_price','average_price','product_name',]


class ProductCumulativeSerializer(serializers.ModelSerializer):
    parent = serializers.CharField()
    sp = serializers.FloatField()

    class Meta:
        model = Product
        fields = ['product_name','parent','sp',]


class QuarterSerializer(serializers.ModelSerializer):
    month = serializers.CharField()
    target = serializers.IntegerField()
    achieved = serializers.IntegerField()

    class Meta:
        model = OrganizationLeadDetails
        fields = ['month','target','achieved',]

class AchievementYearWiseSerializer(serializers.ModelSerializer):
    month = serializers.CharField()
    prev = serializers.IntegerField()
    curr = serializers.IntegerField()

    class Meta:
        model = OrganizationLeadDetails
        fields = ['month','prev','curr',]