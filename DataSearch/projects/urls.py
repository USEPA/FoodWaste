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

from django.conf.urls import url
from projects.views import ProjectCreateView, ProjectDetailView, \
    ProjectEditView, ProjectListView, APICentersListView, \
    APIDivisionsListView, APIBranchesListView

urlpatterns = [
    url(r'^$', ProjectListView.as_view(), name='project_list'),

    url(r'^create/?$', ProjectCreateView.as_view(), name='project_create'),

    url(r'^detail/(?P<pk>\d+)/?$',
        ProjectDetailView.as_view(),
        name='project_detail'),

    url(r'^edit/(?P<pk>\d+)/?$',
        ProjectEditView.as_view(),
        name='project_edit'),

    # /api/ URLS:
    # /api/centers/<office_pk>/
    url(r'^api/centers/(?P<pk>\d+)/?$',
        APICentersListView.as_view(),
        name='centers_json'),

    # /api/divisions/<centeroffice_pk>/
    url(r'^api/divisions/(?P<pk>\d+)/?$',
        APIDivisionsListView.as_view(),
        name='divisions_json'),

    # /api/branches/<division_pk>/
    url(r'^api/branches/(?P<pk>\d+)/?$',
        APIBranchesListView.as_view(),
        name='branches_json'),
]
