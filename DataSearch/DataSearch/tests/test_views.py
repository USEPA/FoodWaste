# test_views.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=W0511,R0904

"""
This file demonstrates writing tests using the unittest module.

These will pass when you run "manage.py test".
"""

import django
from django.db.models.query import QuerySet, EmptyQuerySet
from django.test import Client, TestCase
from django.test.client import RequestFactory
from accounts.models import User
from DataSearch.models import ExistingData, ExistingDataSource, ExistingDataSharingTeamMap
from DataSearch.views import get_existing_data_all, check_can_edit, get_existing_data_team, \
    get_existing_data_user, ExistingDataDetail, ExistingDataEdit
from teams.models import Team, TeamMembership


class ViewTestAuthenticated(TestCase):
    """Tests for the application views."""

    if django.VERSION[:2] >= (1, 7):
        # Django 1.7 requires an explicit setup() when running tests in PTVS.
        @classmethod
        def setUpClass(cls):
            """Add method docstring."""  # TODO add docstring.
            super(ViewTestAuthenticated, cls).setUpClass()
            django.setup()

    def setUp(self):
        self.request_factory = RequestFactory()
        self.test_str = 'Test'
        self.client = Client()
        # User 1 created the team, User 2 created ExistingData, User 3 has no privileges
        self.user1 = User.objects.create_user(username='testuser1', password='12345')
        self.user2 = User.objects.create_user(username='testuser2', password='12345')
        self.user3 = User.objects.create_user(username='testuser3', password='12345')
        self.client.login(username='dyoung11', password='Evelynj1!')
        self.user = User.objects.get(id=1)
        self.team = Team.objects.create(created_by=self.user1, name='testteam')
        TeamMembership.objects.create(
            member=self.user1, team=self.team, is_owner=True, can_edit=True)
        # Build some models to be used in this test class:
        self.source = ExistingDataSource.objects.get(id=1)
        self.dat = ExistingData.objects.create(
            work=self.test_str, email=self.test_str, phone=self.test_str,
            search=self.test_str, source=self.source, source_title=self.test_str,
            keywords=self.test_str, url=self.test_str, disclaimer_req=False,
            citation=self.test_str, comments=self.test_str, created_by=self.user2)
        self.dat_team_map = ExistingDataSharingTeamMap.objects.create(
            data=self.dat, team=self.team, can_edit=True)
        # TODO: Need at least one QAPP and SectionA object to fully test clean_qapps

    def test_home(self):
        """Tests the home page."""
        response = self.client.get('/')
        self.assertContains(response, 'Existing Data and Information Search Tool', 2, 200)
        self.assertContains(response, 'CESER QAPP Builder for Category A or B', 1, 200)

    def test_contact(self):
        """Tests the contact page."""
        response = self.client.get('/contact')
        self.assertContains(response,
                            'Environmental Decision Analytics Branch (EDAB)',
                            1, 200)
        self.assertContains(response, 'Plastics Projects Research (EDAB)', 1, 200)

    def test_web_dev_tools_get(self):
        """TODO."""
        response = self.client.get('/dev')
        self.assertContains(response, 'QAPP Module Management', 1, 200)
        self.assertContains(response, 'Clean Extra Spaces from QAPP Data', 1, 200)

    def test_clean_qapps(self):
        """TODO."""
        response = self.client.get('/dev/clean_qapps')
        self.assertContains(response, 'QAPP Module Management', 1, 200)
        self.assertContains(response, 'Clean Extra Spaces from QAPP Data', 1, 200)

    def test_get_existing_data_all(self):
        data = get_existing_data_all()
        self.assertIsInstance(data, QuerySet)
        self.assertNotIsInstance(data, EmptyQuerySet)
        self.assertEqual(len(data), 1)

    def test_get_existing_data_user(self):
        data = get_existing_data_user(self.user2.id)
        self.assertIsInstance(data, QuerySet)
        self.assertNotIsInstance(data, EmptyQuerySet)
        self.assertEqual(len(data), 1)

    def test_get_existing_data_team(self):
        data = get_existing_data_team(self.team.id)
        self.assertIsInstance(data, QuerySet)
        self.assertNotIsInstance(data, EmptyQuerySet)
        self.assertEqual(len(data), 1)

    def test_get_existing_data_team_empty(self):
        data = get_existing_data_team(0)
        self.assertNotIsInstance(data, QuerySet)
        self.assertEqual(len(data), 0)

    def test_check_can_edit_user(self):
        self.assertTrue(check_can_edit(self.dat, self.user2))

    def test_check_can_edit_team(self):
        self.assertTrue(check_can_edit(self.dat, self.user1))

    def test_check_can_edit_super(self):
        self.assertTrue(check_can_edit(self.dat, self.user))

    def test_check_can_edit_fail(self):
        self.assertFalse(check_can_edit(self.dat, self.user3))

    def test_existingdata_index(self):
        """TODO."""
        response = self.client.get('/existingdata')
        self.assertContains(response, 'Existing Data Tracking Tool', 1, 200)
        self.assertContains(
            response, 'Existing Data and Information Research Projects', 1, 200)
        self.assertContains(response, 'View existing entries for...', 1, 200)
        self.assertContains(response, 'New Team', 1, 200)
        self.assertContains(response, 'New Data Entry', 1, 200)

    def test_existingdata_list_user(self):
        """TODO."""
        response = self.client.get('/existingdata/list/user/' + str(self.user.id))
        self.assertContains(response, 'Existing Data Tracking Tool', 1, 200)
        self.assertContains(response, 'View or Edit Existing Data', 1, 200)
        self.assertContains(response, 'Export All Data to Docx', 1, 200)
        self.assertContains(response, 'Export All Data to PDF', 1, 200)
        self.assertContains(response, 'Export All Data to Excel', 1, 200)

    def test_existingdata_list_team(self):
        """TODO."""
        response = self.client.get('/existingdata/list/team/' + str(self.team.id))
        self.assertContains(response, 'Existing Data Tracking Tool', 1, 200)
        self.assertContains(response, 'View or Edit Existing Data', 1, 200)
        self.assertContains(response, 'Export All Data to Docx', 1, 200)
        self.assertContains(response, 'Export All Data to PDF', 1, 200)
        self.assertContains(response, 'Export All Data to Excel', 1, 200)

    def test_existingdata_list_all(self):
        """TODO."""
        response = self.client.get('/existingdata/list/')
        self.assertContains(response, 'Existing Data Tracking Tool', 1, 200)
        self.assertContains(response, 'View or Edit Existing Data', 1, 200)
        self.assertContains(response, 'Export All Data to Docx', 1, 200)
        self.assertContains(response, 'Export All Data to PDF', 1, 200)
        self.assertContains(response, 'Export All Data to Excel', 1, 200)

    def test_existingdata_detail_team(self):
        """TODO."""
        header = {'HTTP_REFERER': '/existingdata/list/team/' + str(self.team.id)}
        response = self.client.get('/existingdata/detail/' + str(self.dat.id), **header)
        self.assertContains(response, 'Details for Existing Data', 1, 200)
        self.assertContains(response, 'Export to Docx', 1, 200)
        self.assertContains(response, 'Export to PDF', 1, 200)
        self.assertContains(response, 'Export to Excel', 1, 200)
        self.assertContains(response, 'Back', 1, 200)
        self.assertContains(response, 'Edit Data Entry', 1, 200)
        self.assertContains(response, 'Delete Data Entry', 1, 200)

    def test_existingdata_detail_user(self):
        """TODO."""
        header = {'HTTP_REFERER': '/existingdata/list/user/' + str(self.user.id)}
        response = self.client.get('/existingdata/detail/' + str(self.dat.id), **header)
        self.assertContains(response, 'Details for Existing Data', 1, 200)
        self.assertContains(response, 'Export to Docx', 1, 200)
        self.assertContains(response, 'Export to PDF', 1, 200)
        self.assertContains(response, 'Export to Excel', 1, 200)
        self.assertContains(response, 'Back', 1, 200)
        self.assertContains(response, 'Edit Data Entry', 1, 200)
        self.assertContains(response, 'Delete Data Entry', 1, 200)

    def test_existingdata_detail_no_edit(self):
        """TODO."""
        header = {'HTTP_REFERER': '/existingdata/list/user/' + str(self.user.id)}
        path = '/existingdata/detail/' + str(self.dat.id)
        request = self.request_factory.get(path, **header)
        request.user = self.user3
        response = ExistingDataDetail.as_view()(pk=str(self.dat.id), request=request)
        self.assertContains(response, 'Details for Existing Data', 1, 200)
        self.assertContains(response, 'Export to Docx', 1, 200)
        self.assertContains(response, 'Export to PDF', 1, 200)
        self.assertContains(response, 'Export to Excel', 1, 200)
        self.assertContains(response, 'Back', 1, 200)
        self.assertNotContains(response, 'Edit Data Entry', 200)
        self.assertNotContains(response, 'Delete Data Entry', 200)
        self.assertContains(response, 'You cannot edit this data', 1, 200)

    def test_existingdata_edit_get(self):
        """TODO."""
        response = self.client.get('/existingdata/edit/' + str(self.dat.id))
        self.assertContains(response, 'Save', 1, 200)
        self.assertContains(response, 'Reset', 1, 200)
        self.assertContains(response, 'Cancel', 1, 200)

    def test_existingdata_edit_get_no(self):
        """TODO."""
        request = self.request_factory.get('/existingdata/edit/' + str(self.dat.id))
        request.user = self.user3
        response = ExistingDataEdit.as_view()(pk=str(self.dat.id), request=request)
        self.assertEquals(response.status_code, 302)


