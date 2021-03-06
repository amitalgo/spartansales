from django.shortcuts import render
from django.contrib.auth.models import User

from rest_framework import generics

# Rest Login Import
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from django.http import JsonResponse
from django.core.serializers.json import DjangoJSONEncoder
import json

from django.core import serializers
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response

from employee.serializers import LoginSerializer

# # Create your views here.

# @csrf_exempt
# @api_view(["POST"])
# @permission_classes((AllowAny,))
# def login(request):
#     username = request.data.get("username")
#     password = request.data.get("password")
#     if username is None or password is None:
#         return Response({'status':False,'type':'error','message': 'Please provide both username and password'},
#                         status=HTTP_400_BAD_REQUEST)
#     user = authenticate(username=username, password=password)
#     if not user:
#         return Response({'status':False,'type':'error','message': 'Invalid Credentials'},
#                         status=HTTP_404_NOT_FOUND)
#     token, _ = Token.objects.get_or_create(user=user)
#     return Response({'status':True,'type':'success','message': "Logged In SuccessFully",'data':user},
#                     status=HTTP_200_OK,headers={'X_AUTH_TOKEN':token.key})


class LoginView(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        if not serializer.is_valid(raise_exception=False):
            return Response({"status": "False", "type":'error','message': serializer.errors,'data':[]},
                            status=HTTP_400_BAD_REQUEST)

        user = serializer.validated_data['user']
        user_data=User.objects.get(pk=user.id)
        rr=LoginSerializer(instance=user_data)
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            "status": "True",
            "type": 'success',
            "message": 'Logged In SuccessFully',
            'data': rr.data
                # json.loads(rr.replace("\'", '"'))
        },status=HTTP_200_OK,headers={'X_AUTH_TOKEN':token.key})