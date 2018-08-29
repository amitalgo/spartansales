# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-08-29 06:59
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0003_auto_20180828_1425'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employeebranch',
            name='employee',
            field=models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, to='employee.Employee'),
        ),
        migrations.AlterField(
            model_name='employeebranch',
            name='user',
            field=models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
