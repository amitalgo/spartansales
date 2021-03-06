# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-09-05 06:44
from __future__ import unicode_literals

from django.db import migrations
import django.db.models.deletion
import smart_selects.db_fields


class Migration(migrations.Migration):

    dependencies = [
        ('leads', '0005_auto_20180905_1140'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationleaddetails',
            name='product',
            field=smart_selects.db_fields.ChainedForeignKey(auto_choose=True, chained_field='department', chained_model_field='product__productdepartment_department', null=True, on_delete=django.db.models.deletion.CASCADE, to='product.Product'),
        ),
    ]
