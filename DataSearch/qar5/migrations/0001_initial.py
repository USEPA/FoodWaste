# Generated by Django 3.0.3 on 2020-02-12 17:02

import constants.utils
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Division',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Qapp',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('division_branch', models.CharField(max_length=255)),
                ('title', models.CharField(max_length=255)),
                ('qa_category', models.CharField(max_length=255)),
                ('intra_extra', models.CharField(max_length=64)),
                ('revision_number', models.CharField(max_length=255)),
                ('date', models.DateTimeField(default=django.utils.timezone.now)),
                ('prepared_by', models.CharField(max_length=255)),
                ('strap', models.CharField(max_length=255)),
                ('tracking_id', models.CharField(max_length=255)),
                ('division', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='divisions', to='qar5.Division')),
            ],
        ),
        migrations.CreateModel(
            name='QappApproval',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_plan_title', models.CharField(max_length=255)),
                ('activity_number', models.CharField(max_length=255)),
                ('qapp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='qar5.Qapp')),
            ],
        ),
        migrations.CreateModel(
            name='SectionA',
            fields=[
                ('qapp', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='qar5.Qapp')),
                ('a3', models.CharField(max_length=2047)),
                ('a4', models.CharField(max_length=2047)),
                ('a4_chart', models.FileField(blank=True, null=True, upload_to=constants.utils.get_attachment_storage_path)),
                ('a5', models.CharField(max_length=2047)),
                ('a6', models.CharField(max_length=2047)),
                ('a7', models.CharField(max_length=2047)),
                ('a8', models.CharField(max_length=2047)),
                ('a9', models.CharField(max_length=2047)),
                ('a9_drive_path', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='SectionB',
            fields=[
                ('qapp', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='qar5.Qapp')),
                ('b1_2', models.CharField(max_length=2047)),
                ('b1_3', models.CharField(max_length=2047)),
                ('b1_4', models.CharField(max_length=2047)),
                ('b1_5', models.CharField(max_length=2047)),
                ('b2_1', models.CharField(max_length=2047)),
                ('b2_2', models.CharField(max_length=2047)),
                ('b2_3', models.CharField(max_length=2047)),
                ('b2_4', models.CharField(max_length=2047)),
                ('b2_5', models.CharField(max_length=2047)),
                ('b3', models.CharField(max_length=2047)),
                ('b4', models.CharField(max_length=2047)),
            ],
        ),
        migrations.CreateModel(
            name='SectionC',
            fields=[
                ('qapp', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='qar5.Qapp')),
                ('c1', models.CharField(max_length=2047)),
                ('c2', models.CharField(max_length=2047)),
            ],
        ),
        migrations.CreateModel(
            name='SectionD',
            fields=[
                ('qapp', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='qar5.Qapp')),
                ('d1', models.CharField(max_length=2047)),
                ('d2', models.CharField(max_length=2047)),
                ('d3', models.CharField(max_length=2047)),
            ],
        ),
        migrations.CreateModel(
            name='Revision',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('revision', models.CharField(max_length=255)),
                ('description', models.CharField(max_length=255)),
                ('effective_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('initial_version', models.CharField(max_length=255)),
                ('qapp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='qar5.Qapp')),
            ],
        ),
        migrations.CreateModel(
            name='QappLead',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('qapp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='qar5.Qapp')),
            ],
        ),
        migrations.CreateModel(
            name='QappApprovalSignature',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contractor', models.BooleanField(blank=True, default=False)),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('signature', models.CharField(blank=True, max_length=255, null=True)),
                ('date', models.CharField(blank=True, max_length=255, null=True)),
                ('qapp_approval', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='qar5.QappApproval')),
            ],
        ),
    ]
