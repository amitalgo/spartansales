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
        ('achievement', '0001_initial'),
        ('employee', '0001_initial'),
        ('branch', '0001_initial'),
        ('leads', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='goal',
            name='department',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='leads.Department'),
        ),
        migrations.AddField(
            model_name='goal',
            name='goal_matrix',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='achievement.GoalMatrix'),
        ),
        migrations.AddField(
            model_name='goal',
            name='parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='achievement.Goal'),
        ),
        migrations.AddField(
            model_name='goal',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.Product'),
        ),
        migrations.AddField(
            model_name='assigngoal',
            name='assignTo',
            field=smart_selects.db_fields.ChainedForeignKey(auto_choose=True, chained_field='branch', chained_model_field='branch', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='fetch_assign', to='employee.EmployeeBranch'),
        ),
        migrations.AddField(
            model_name='assigngoal',
            name='branch',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='branch.Branch'),
        ),
        migrations.AddField(
            model_name='assigngoal',
            name='goal',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='achievement.Goal'),
        ),
    ]
