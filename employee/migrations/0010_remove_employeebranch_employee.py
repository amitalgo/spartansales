# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-09-19 13:11
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0009_employeebranch_employee'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employeebranch',
            name='employee',
        ),
    ]
