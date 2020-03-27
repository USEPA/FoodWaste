# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='requestsubject',
            name='is_active',
            field=models.CharField(blank=True, max_length=5, null=True, choices=[(b'', b''), (b'Y', b'Y'), (b'N', b'N')]),
        ),
    ]
