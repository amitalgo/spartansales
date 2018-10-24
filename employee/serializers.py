from rest_framework import serializers
from django.contrib.auth.models import User, Group
from .models import Employee
from leads.models import EmployeeBranch
from branch.models import Branch

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = '__all__'

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        # fields = '__all__'
        exclude = ('permissions',)

class BranchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Branch
        fields = '__all__'

class EmployeeBranchSerializer(serializers.ModelSerializer):
    branch = BranchSerializer()

    class Meta:
        model = EmployeeBranch
        fields = ('branch',)

class LoginSerializer(serializers.ModelSerializer):
    groups = GroupSerializer(many=True)
    # employeebranch = serializers.PrimaryKeyRelatedField(read_only=True)

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['employee'] = EmployeeSerializer(instance.employee).data
        response['branch'] = EmployeeBranchSerializer(instance.employeebranch).data
        return response

    class Meta:
        model = User
        fields= '__all__'
        # extra_fields = ['employee_mobile']