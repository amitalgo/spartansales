# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-04 11:56
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0003_companies_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='companies',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]