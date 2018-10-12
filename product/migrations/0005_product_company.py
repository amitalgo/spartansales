# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-11 06:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0013_auto_20181005_1351'),
        ('product', '0004_remove_product_unit'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='company',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='companies.Companies'),
        ),
    ]