# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-08-28 07:23
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employeebranch',
            name='user',
            field=models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, related_name='creator_id_branch', to='employee.Employee'),
        ),
    ]
