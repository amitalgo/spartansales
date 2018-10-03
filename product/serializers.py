from .models import Product

from rest_framework import serializers

class ProductSerializer(serializers.ModelSerializer):
    child = serializers.CharField()

    class Meta:
        model = Product
        fields = ['id','product_name','product_code','parent_id','child',]