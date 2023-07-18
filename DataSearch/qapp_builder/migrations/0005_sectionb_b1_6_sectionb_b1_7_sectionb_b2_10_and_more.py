# Generated by Django 4.2.3 on 2023-07-18 13:36

import constants.utils
from django.conf import settings
import django.core.files.storage
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('qapp_builder', '0004_sectiona_a2_keywords'),
    ]

    operations = [
        migrations.AddField(
            model_name='sectionb',
            name='b1_6',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b1_7',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b2_10',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b2_9',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b4_6',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b4_7',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b4_8',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_1_1',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_1_2',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_1',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_2',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_3',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_4',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_5',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_6',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_7',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_2_8',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_3',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_4',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b5_5',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b6_3',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b6_4',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionb',
            name='b6_5',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='sectionc',
            name='c1',
            field=models.TextField(default='For __category__ projects, at least one QA audit is required per ORD QA Policy titled Use of the Graded Approach for Quality Assurance of Research.  A technical systems audit TSA will be completed within one year of the initial QA Project Plan approval date for this research effort. The TSA will be conducted in accordance with ORD QA Policy titled Audits of Technical and Quality Systems. Draft publications resulting from this project will undergo ORD clearance in STICS prior to dissemination as required by ORD Policy titled ORD Clearance Policy and Procedures and CESER SOP titled Standard Operating Procedure for Product Clearance.'),
        ),
        migrations.AddField(
            model_name='sectionc',
            name='c2',
            field=models.TextField(default='Results of QA audits will be reported in accordance with ORD QA Policy titled Audits of Technical and Quality Systems.  Implementation of corrective actions for audit findings will be verified by the QA Manager, and status of implementation tracked through closure. Required approvals for draft publications undergoing ORD clearance is documented in STICS.'),
        ),
        migrations.AlterField(
            model_name='sectionbtypemap',
            name='sectionb_type',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='qapp_builder.sectionbtype'),
        ),
        migrations.CreateModel(
            name='Attachment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('file', models.FileField(blank=True, null=True, storage=django.core.files.storage.FileSystemStorage(base_url='/uploads', location='c:\\git\\projects\\epa\\datasearch\\DataSearch\\DataSearch/media\\uploads'), upload_to=constants.utils.get_attachment_storage_path)),
                ('uploaded_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='qapp_builder_uploaded_by', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
