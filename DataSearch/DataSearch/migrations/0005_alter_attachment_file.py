# Generated by Django 4.1.5 on 2023-01-18 16:31

import constants.utils
import django.core.files.storage
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('DataSearch', '0004_auto_20200715_0855'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attachment',
            name='file',
            field=models.FileField(blank=True, null=True, storage=django.core.files.storage.FileSystemStorage(base_url='/uploads', location='C:\\GQC\\git\\projects\\epa\\foodwaste\\DataSearch\\DataSearch/media\\uploads'), upload_to=constants.utils.get_attachment_storage_path),
        ),
    ]
