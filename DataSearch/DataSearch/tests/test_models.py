# test_models.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0511,R0904

"""
This file demonstrates writing tests using the unittest module.

These will pass when you run "manage.py test".
"""

from accounts.models import User
import django
from django.test import Client, TestCase
from django.test.client import RequestFactory
from DataSearch.models import Attachment, ExistingDataSource, ExistingData


class AttachmentTest(TestCase):
    """Tests for the model object Attachment."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add method docstring."""  # TODO add docstring.
            super(AttachmentTest, cls).setUpClass()
            django.setup()

    def setUp(self):
        self.user = User.objects.get(id=1)
        self.att = Attachment.objects.create(
            name='Test', file='', uploaded_by=self.user)

    def test_attachment_str(self):
        self.assertTrue(isinstance(self.att, Attachment))
        self.assertEqual(str(self.att), 'Test')


class ExistingDataSourceTest(TestCase):
    """Tests for the model object ExistingDataSource."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add method docstring."""  # TODO add docstring.
            super(ExistingDataSourceTest, cls).setUpClass()
            django.setup()

    def setUp(self):
        self.dat = ExistingDataSource.objects.get(id=1)

    def test_existingdatasource_str(self):
        self.assertTrue(isinstance(self.dat, ExistingDataSource))
        self.assertEqual(str(self.dat), 'Abstract')


class ExistingDataTest(TestCase):
    """Tests for the model object ExistingData."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add method docstring."""  # TODO add docstring.
            super(ExistingDataTest, cls).setUpClass()
            django.setup()

    def setUp(self):
        self.test_str = 'Test'
        self.user = User.objects.get(id=1)
        self.source = ExistingDataSource.objects.get(id=1)
        self.dat = ExistingData.objects.create(
            work=self.test_str, email=self.test_str, phone=self.test_str,
            search=self.test_str, source=self.source,
            source_title=self.test_str, keywords=self.test_str,
            url=self.test_str, disclaimer_req=False, citation=self.test_str,
            comments=self.test_str, created_by=self.user)

    def test_existingdata_str(self):
        self.assertTrue(isinstance(self.dat, ExistingData))
        self.assertEqual(str(self.dat), 'Test')

    def test_existingdata_get_fields(self):
        self.assertIsNotNone(self.dat.get_fields())
