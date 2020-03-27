# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-04-10 20:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rms', '0009_auto_20180410_2046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='program',
            name='acronym',
            field=models.CharField(editable=False, max_length=32),
        ),
        migrations.AlterField(
            model_name='program',
            name='rms_id',
            field=models.IntegerField(editable=False, unique=True),
        ),
        migrations.AlterField(
            model_name='program',
            name='url',
            field=models.CharField(blank=True, editable=False, max_length=1024, null=True),
        ),
    ]