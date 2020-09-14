# Generated by Django 3.0.4 on 2020-07-15 12:55

import constants.utils
import django.core.files.storage
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('DataSearch', '0003_auto_20200423_0921'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attachment',
            name='file',
            field=models.FileField(blank=True, null=True, storage=django.core.files.storage.FileSystemStorage(base_url='/uploads', location='.\\DataSearch/media\\uploads'), upload_to=constants.utils.get_attachment_storage_path),
        ),
    ]