# Generated by Django 3.0.3 on 2020-02-18 18:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('qar5', '0002_division_fixture'),
    ]

    operations = [
        migrations.CreateModel(
            name='SectionBType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.AddField(
            model_name='sectiona',
            name='sectionb_type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='sectionb_type', to='qar5.SectionBType'),
        ),
    ]
