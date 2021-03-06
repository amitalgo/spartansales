# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-09-04 11:47
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import smart_selects.db_fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('product', '0001_initial'),
        ('leads', '0001_initial'),
        ('employee', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='organizationleaddetails',
            name='product',
            field=smart_selects.db_fields.ChainedForeignKey(auto_choose=True, chained_field='department', chained_model_field='department', null=True, on_delete=django.db.models.deletion.CASCADE, to='product.Product'),
        ),
        migrations.AddField(
            model_name='orderlost',
            name='lead',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='leads.OrganizationLeadDetails'),
        ),
        migrations.AddField(
            model_name='orderlost',
            name='reasontye',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='leads.ReasonType'),
        ),
        migrations.AddField(
            model_name='leadstatus',
            name='assignedLead',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='leads.AssignLeads'),
        ),
        migrations.AddField(
            model_name='leadstatus',
            name='lead_status',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='leads.LeadStatusType'),
        ),
        migrations.AddField(
            model_name='assignleads',
            name='assignTo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employee.Employee'),
        ),
        migrations.AddField(
            model_name='assignleads',
            name='lead',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='leads.OrganizationLeadDetails'),
        ),
    ]
