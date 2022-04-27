# urls.py (flowsa)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for DataSearch."""

from django.urls import re_path
from flowsa.views import FlowsaDelete, FlowsaIndex, \
    flowsa_download

app_name = 'flowsa'

urlpatterns = [
    re_path(r'^$', FlowsaIndex.as_view(), name='flowsa_index'),
    re_path(r'^download_file/(?P<pk>\d+)/?$',
            flowsa_download,
            name='flowsa_download'),
    re_path(r'^download_files/?$',
            flowsa_download,
            name='flowsa_downloads'),
    re_path(r'^delete_file/(?P<pk>\d+)/?$',
            FlowsaDelete.as_view(),
            name='flowsa_delete'),
]
