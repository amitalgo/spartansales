from django.shortcuts import render
from django.http import HttpResponse
from product.models import ProductDepartment
import json

from .models import Product

from rest_framework import generics

from .serializers import ProductSerializer

# Create your views here.
def fetchProductByDepartment(request):
    id = request.GET.get('id', '')
    result = list(ProductDepartment.objects.filter(department_id=int(id)).values('product_id', 'product__product_name'))
    return HttpResponse(json.dumps(result), content_type="application/json")

class ProductListAPIView(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        company_id = self.request.META.get('HTTP_COMPANY_ID', None)

        query = "SELECT p.*,IFNULL(concat(p.id,',',GROUP_CONCAT(c.id)),p.id) as child FROM product_product as p left join product_product as c on c.parent_id=p.id where p.status=1 and p.company_id=" +company_id+ " group by p.id"

        return Product.objects.raw(query)