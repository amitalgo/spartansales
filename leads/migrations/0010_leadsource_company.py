# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-08 07:22
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0013_auto_20181005_1351'),
        ('leads', '0009_auto_20180917_1215'),
    ]

    operations = [
        migrations.AddField(
            model_name='leadsource',
            name='company',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='companies.Companies'),
        ),
    ]
