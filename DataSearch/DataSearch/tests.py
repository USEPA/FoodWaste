# tests.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0511,R0904

"""
This file demonstrates writing tests using the unittest module.

These will pass when you run "manage.py test".
"""

import django
from django.test import TestCase

# TODO: Configure your database in settings.py and sync before running tests.


class ViewTest(TestCase):
    """Tests for the application views."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add docstring."""
            super(ViewTest, cls).setUpClass()
            django.setup()

    def test_home(self):
        """Tests the home page."""
        response = self.client.get('/')
        self.assertContains(response, 'Home Page', 0, 200)

    def test_contact(self):
        """Tests the contact page."""
        response = self.client.get('/contact')
        self.assertContains(response, 'Contact', 1, 200)

    def test_about(self):
        """Tests the about page."""
        response = self.client.get('/about')
        self.assertContains(response, 'About', 1, 200)