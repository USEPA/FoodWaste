# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-04-10 19:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rms', '0005_auto_20180406_1916_squashed_0009_task_program'),
    ]

    operations = [
        migrations.AddField(
            model_name='program',
            name='show_project',
            field=models.BooleanField(default=True),
        ),
    ]