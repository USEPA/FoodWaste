# urls.py (scifinder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for DataSearch."""

from django.urls import re_path
from scifinder.views import ScifinderDelete, ScifinderIndex, \
    scifinder_download

app_name = 'scifinder'

urlpatterns = [
    re_path(r'^$', ScifinderIndex.as_view(), name='scifinder_index'),
    re_path(r'^download_file/(?P<pk>\d+)/?$',
            scifinder_download,
            name='scifinder_download'),
    re_path(r'^download_files/?$',
            scifinder_download,
            name='scifinder_downloads'),
    re_path(r'^delete_file/(?P<pk>\d+)/?$',
            ScifinderDelete.as_view(),
            name='scifinder_delete'),
]
