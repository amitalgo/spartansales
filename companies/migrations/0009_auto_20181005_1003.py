# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-05 04:33
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0008_auto_20181005_1000'),
    ]

    operations = [
        migrations.AlterField(
            model_name='companies',
            name='user',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]