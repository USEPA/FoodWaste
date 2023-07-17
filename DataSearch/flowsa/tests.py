# tests.py (flowsa)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=C0301
"""
This file houses test cases for the FLOWSA module.

Available functions:
- None
"""

import django
from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase
from django.test.client import RequestFactory
from django.contrib.auth.models import User
from flowsa.models import Upload
from flowsa.views import FlowsaIndex


class TestFlowsa(TestCase):
    """Test utils."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Prepare objects for testing."""
            super(TestFlowsa, cls).setUpClass()
            django.setup()

    def setUp(self):
        """Prepare various objects for this class of tests."""
        self.request_factory = RequestFactory()
        self.test_str = 'Test'
        self.user = User.objects.create_user(username='testuser',
                                             password='12345')
        self.client.login(username='testuser', password='12345')
        self.file = SimpleUploadedFile('test.txt', b'This is a test file.')
        self.upload_1 = Upload.objects.create(name=self.test_str,
                                              file=self.file,
                                              uploaded_by=self.user)
        self.upload_2 = Upload.objects.create(name=self.test_str,
                                              file=self.file,
                                              uploaded_by=self.user)
        self.upload_dict = {
            'name': self.test_str,
            'file': self.file,
            'uploaded_by': self.user
        }

    ############################
    # START test models section

    def test_upload_str(self):
        """Test the string method for Upload class."""
        self.assertEqual(self.upload_2.name, str(self.upload_2))

    # END test models section
    ############################
    ############################
    # START test views section

    def test_flowsa_index_get(self):
        """Test the get method for the flowsa index (list) page."""
        request = self.request_factory.get('/flowsa/')
        request.user = self.user
        response = FlowsaIndex.as_view()(request=request)
        print(response)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'FLOWSA Project Lead', 1)
        self.assertContains(response, 'Drop Files Here to Upload', 1)
        self.assertContains(response, 'Uploaded Files', 1)
        self.assertContains(response, 'Download All', 1)

    def test_flowsa_index_post(self):
        """Test the get method for the flowsa index (list) page."""
        request = self.request_factory.post('/flowsa/', data=self.upload_dict)
        request.user = self.user
        request.FILES['file'] = self.file
        response = FlowsaIndex.as_view()(request=request)
        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, b'"is_valid": false')
        self.assertContains(response, b'"is_valid": true')

    def test_flowsa_index_post_bad(self):
        """Test the get method for the flowsa index (list) page."""
        request = self.request_factory.post('/flowsa/', data=self.upload_dict)
        request.user = self.user
        response = FlowsaIndex.as_view()(request=request)
        print(response.content)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content, b'{"is_valid": false}')

    def test_flowsa_delete(self):
        """Test the delete method for flowsa uploads."""
        upload = Upload.objects.create(name=self.test_str,
                                       file=self.file,
                                       uploaded_by=self.user)
        pk = upload.id
        # Delete the file and check the return code is good.
        response = self.client.get(f'/flowsa/delete_file/{pk}/')
        self.assertEqual(response.status_code, 200)
        # TODO verify the file is deleted...
        # upload = Upload.objects.filter(id=pk).first()
        # self.assertIsNone(upload)

    def test_flowsa_delete_redirect(self):
        """Test the delete method for flowsa uploads."""
        response = self.client.get('/flowsa/delete_file/0/')
        self.assertEqual(response.status_code, 302)

    def test_flowsa_download_single(self):
        """Test the flowsa file download method for one upload file."""
        response = self.client.get(
            f'/flowsa/download_file/{self.upload_1.id}/')
        self.assertEqual(response.status_code, 200)
        self.assertTrue(b'This is a test file.' in response.content)

    def test_flowsa_download_all(self):
        """
        Test flowsa download all.

        Test the flowsa file download method for all the user's upload files.
        """
        response = self.client.get('/flowsa/download_files/')
        self.assertEqual(response.status_code, 200)
        self.assertTrue(b'This is a test file.' in response.content)
        self.assertTrue(response.content.startswith(b'PK'))

    # END test views section
    ############################
