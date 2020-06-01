# test_views.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0511,R0904

"""
This file demonstrates writing tests using the unittest module.

These will pass when you run "manage.py test".
"""

# from unittest import TestCase
from io import BytesIO
import django
from django.db.models.query import QuerySet, EmptyQuerySet
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import Client, TestCase
from django.test.client import RequestFactory
from accounts.models import User
from DataSearch.forms import ExistingDataForm
from DataSearch.models import Attachment, ExistingData, ExistingDataSource, \
    ExistingDataSharingTeamMap
from DataSearch.views_exports import add_attachments_to_zip
from teams.models import Team, TeamMembership
from zipfile import ZipFile 


class TestViewExportsAuthenticated(TestCase):
    """Tests for the application views."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """TODO."""
            super(TestViewExportsAuthenticated, cls).setUpClass()
            django.setup()

    def setUp(self):
        self.request_factory = RequestFactory()
        self.test_str = 'Test'
        self.client = Client()
        self.client.login(username='dyoung11', password='Evelynj1!')
        # User 1 created the team, User 2 created ExistingData, User 3 has no privileges
        self.user = User.objects.get(id=1)
        self.team = Team.objects.create(created_by=self.user, name='testteam')
        TeamMembership.objects.create(
            member=self.user, team=self.team, is_owner=True, can_edit=True)
        # Build some models to be used in this test class:
        self.source = ExistingDataSource.objects.get(id=1)
        self.data_dict = {
            'work': self.test_str, 'email': self.test_str, 'phone': self.test_str,
            'search': self.test_str, 'source': self.source,
            'source_title': self.test_str, 'keywords': self.test_str,
            'url': self.test_str, 'disclaimer_req': True, 'citation': self.test_str,
            'comments': self.test_str, 'created_by': self.user,
            'teams': []}
        self.dat = ExistingData.objects.create(
            work=self.test_str, email=self.test_str, phone=self.test_str,
            search=self.test_str, source=self.source, source_title=self.test_str,
            keywords=self.test_str, url=self.test_str, disclaimer_req=False,
            citation=self.test_str, comments=self.test_str, created_by=self.user)
        self.dat_team_map = ExistingDataSharingTeamMap.objects.create(
            data=self.dat, team=self.team, can_edit=True)
        self.dat.teams.add(self.dat_team_map.team)
        self.file = SimpleUploadedFile('test.txt', b'This is a test file.')
        self.att = Attachment.objects.create(
            name='Test', file=self.file, uploaded_by=self.user)
        self.dat.attachments.add(self.att)

    def test_export_pdf_single(self):
        """Test the function to export a single Existing Data object as PDF."""
        response = self.client.post(f'/existingdata/exportpdf/{self.dat.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'ReportLab Generated PDF document' in response.content)

    def test_add_attachments_to_zip(self):
        """Test the function that adds attachment files to a provided zip archive."""
        zip_mem = BytesIO() 
        archive = ZipFile(zip_mem, 'w') 
        att1 = Attachment.objects.create(name='Test1', file=self.file,
                                        uploaded_by=self.user)
        att2 = Attachment.objects.create(name='Test2', file=self.file,
                                        uploaded_by=self.user)
        self.assertTrue(len(archive.filelist) == 0)
        archive = add_attachments_to_zip(archive, [att1.id, att2.id])
        self.assertTrue(len(archive.filelist) == 2)

    def test_export_excel_single(self):
        """Test the function to export a single Existing Data object as Excel."""
        response = self.client.post(f'/existingdata/exportexcel/{self.dat.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'workbook.xml' in response.content)

    def test_export_doc_single(self):
        """Test the function to export a single Existing Data object as Word Doc."""
        response = self.client.post(f'/existingdata/exportdocx/{self.dat.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'word/numbering.xml' in response.content)

    def test_export_user_doc(self):
        """
        Test the function to export multiple Existing Data objects for a user
        as a zip file of Word Doc.
        """
        response = self.client.post(f'/existingdata/exportdocx/user/{self.user.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'test.docx.zip' in response.content)
        self.assertTrue(b'This is a test file.' in response.content)

    def test_export_user_pdf(self):
        """
        Test the function to export multiple Existing Data objects for a user
        as a zip file of PDF.
        """
        response = self.client.post(f'/existingdata/exportpdf/user/{self.user.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'export_Test.pdf.zip' in response.content)
        self.assertTrue(b'This is a test file.' in response.content)
        self.assertTrue(b'ReportLab Generated PDF document' in response.content)

    def test_export_user_excel(self):
        """
        Test the function to export multiple Existing Data objects for a user
        as a zip file of Excel.
        """
        response = self.client.post(f'/existingdata/exportexcel/user/{self.user.id}')
        self.assertTrue(response.status_code, 200)
        self.assertTrue(b'export_Test.xlsx.zip' in response.content)
        self.assertTrue(b'This is a test file.' in response.content)

    #def test_export_team_doc(self):
    #    """
    #    Test the function to export multiple Existing Data objects for a team
    #    as a zip file of Word Doc.
    #    """
    #    response = self.client.post(f'/existingdata/exportdocx/team/{self.team.id}')
    #    self.assertTrue(response.status_code, 200)
    #    self.assertTrue(b'test.docx.zip' in response.content)
    #    self.assertTrue(b'This is a test file.' in response.content)

    #def test_export_team_pdf(self):
    #    """
    #    Test the function to export multiple Existing Data objects for a team
    #    as a zip file of PDF.
    #    """
    #    response = self.client.post(f'/existingdata/exportpdf/team/{self.team.id}')
    #    self.assertTrue(response.status_code, 200)
    #    self.assertTrue(b'export_Test.pdf.zip' in response.content)
    #    self.assertTrue(b'This is a test file.' in response.content)
    #    self.assertTrue(b'ReportLab Generated PDF document' in response.content)

    #def test_export_team_excel(self):
    #    """
    #    Test the function to export multiple Existing Data objects for a team
    #    as a zip file of Excel.
    #    """
    #    response = self.client.post(f'/existingdata/exportexcel/team/{self.team.id}')
    #    self.assertTrue(response.status_code, 200)
    #    self.assertTrue(b'export_Test.xlsx.zip' in response.content)
    #    self.assertTrue(b'This is a test file.' in response.content)
