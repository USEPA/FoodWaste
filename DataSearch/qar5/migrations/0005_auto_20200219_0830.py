# Generated by Django 3.0.3 on 2020-02-19 13:30

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('qar5', '0004_sectionb_type_fixture'),
    ]

    operations = [
        migrations.AlterField(
            model_name='qapp',
            name='prepared_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
