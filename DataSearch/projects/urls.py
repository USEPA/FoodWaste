# urls.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
URLs related to managing projects of users.

Available functions:
- REST api for projects
- Project management
"""

from django.urls import re_path
from projects.views import ProjectCreateView, ProjectDetailView, \
    ProjectEditView, ProjectListView, APICentersListView, \
    APIDivisionsListView, APIBranchesListView

urlpatterns = [
    re_path(r'^$', ProjectListView.as_view(), name='project_list'),

    re_path(r'^create/?$', ProjectCreateView.as_view(), name='project_create'),

    re_path(r'^detail/(?P<pk>\d+)/?$',
            ProjectDetailView.as_view(),
            name='project_detail'),

    re_path(r'^edit/(?P<pk>\d+)/?$',
            ProjectEditView.as_view(),
            name='project_edit'),

    # /api/ URLS:
    # /api/centers/<office_pk>/
    re_path(r'^api/centers/(?P<pk>\d+)/?$',
            APICentersListView.as_view(),
            name='centers_json'),

    # /api/divisions/<centeroffice_pk>/
    re_path(r'^api/divisions/(?P<pk>\d+)/?$',
            APIDivisionsListView.as_view(),
            name='divisions_json'),

    # /api/branches/<division_pk>/
    re_path(r'^api/branches/(?P<pk>\d+)/?$',
            APIBranchesListView.as_view(),
            name='branches_json'),
]
