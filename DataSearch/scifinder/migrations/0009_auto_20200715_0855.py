# Generated by Django 3.0.4 on 2020-07-15 12:55

import constants.utils
import django.core.files.storage
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scifinder', '0008_auto_20200319_1201'),
    ]

    operations = [
        migrations.AlterField(
            model_name='upload',
            name='file',
            field=models.FileField(blank=True, null=True, storage=django.core.files.storage.FileSystemStorage(base_url='/uploads', location='.\\DataSearch/media\\uploads'), upload_to=constants.utils.get_scifinder_storage_path),
        ),
    ]
