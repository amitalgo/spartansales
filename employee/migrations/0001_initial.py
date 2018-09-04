# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-09-04 11:47
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('branch', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mobile', models.CharField(max_length=251)),
                ('gender', models.CharField(choices=[('male', 'Male'), ('female', 'Female')], max_length=7)),
                ('photo', models.FileField(upload_to='image/employee/profile/')),
                ('address', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('created_by', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, related_name='creator_id', to=settings.AUTH_USER_MODEL)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EmployeeBranch',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('branch', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='branch.Branch')),
                ('employee', models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, to='employee.Employee')),
                ('user', models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EmployeeMedia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mediaType', models.CharField(choices=[('video', 'Video'), ('image', 'Image'), ('ppt', 'PPT'), ('doc', 'DOC')], max_length=50)),
                ('mediaUrl', models.TextField()),
                ('activityType', models.CharField(choices=[('testimonial', 'Testimonial'), ('equipment', 'Equipment'), ('competitor', 'Competitor')], max_length=200)),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employee.Employee')),
            ],
        ),
        migrations.CreateModel(
            name='EmployeeReport',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(choices=[(1, 'Active'), (0, 'Inactive')], default=1, help_text='Active/Inactive')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('employee', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='employee.Employee')),
                ('report_to', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employee_reportTo_id', to='employee.Employee')),
            ],
        ),
    ]
