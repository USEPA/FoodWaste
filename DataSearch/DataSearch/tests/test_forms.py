# test_forms.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0511,R0904

"""
This file demonstrates writing tests using the unittest module.

These will pass when you run "manage.py test".
"""

import django
from django.test import Client, TestCase
from django.test.client import RequestFactory


class FormTest(TestCase):
    """Tests for the application forms."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add method docstring."""  # TODO add docstring.
            super(ViewTest, cls).setUpClass()
            django.setup()
