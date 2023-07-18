# Generated by Django 4.2.3 on 2023-07-18 13:36

import constants.utils
from django.conf import settings
import django.core.files.storage
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('DataSearch', '0006_alter_attachment_file'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attachment',
            name='file',
            field=models.FileField(blank=True, null=True, storage=django.core.files.storage.FileSystemStorage(base_url='/uploads', location='c:\\git\\projects\\epa\\datasearch\\DataSearch\\DataSearch/media\\uploads'), upload_to=constants.utils.get_attachment_storage_path),
        ),
        migrations.AlterField(
            model_name='attachment',
            name='uploaded_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='datasearch_uploaded_by', to=settings.AUTH_USER_MODEL),
        ),
    ]