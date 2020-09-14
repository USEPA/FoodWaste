# urls.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for DataSearch."""

from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include
from DataSearch.views import home, contact, ExistingDataIndex, \
    ExistingDataList, ExistingDataCreate, ExistingDataDetail, \
    ExistingDataEdit, ExistingDataDelete, web_dev_tools, clean_qapps, \
    attachments_download, attachment_delete

from DataSearch.views_exports import export_pdf_single, export_excel_single, \
    export_doc_single, export
from DataSearch.settings import MEDIA_ROOT, MEDIA_URL


urlpatterns = [
    url(r'^admin', admin.site.urls),

    url(r'^$', home, name='home'),
    url(r'^dashboard/?$', home, name='dashboard'),
    url(r'^contact/?$', contact, name='contact'),

    url(r'^dev/?$', web_dev_tools, name='web_dev_tools'),
    url(r'^dev/clean_qapps/?$', clean_qapps, name='clean_qapps'),

    # Begin existingdata URLs.
    # URLs for PDF and Excel exports.
    url(r'^existingdata/exportpdf/(?P<pk>\d+)/?$',
        export_pdf_single, name='existing_data_pdf'),
    url(r'^existingdata/exportpdf/user/(?P<pk>\d+)/?$',
        export, name='existing_data_pdf'),
    url(r'^existingdata/exportpdf/team/(?P<pk>\d+)/?$',
        export, name='existing_data_pdf'),

    url(r'^existingdata/exportexcel/(?P<pk>\d+)/?$',
        export_excel_single, name='existing_data_excel'),
    url(r'^existingdata/exportexcel/user/(?P<pk>\d+)/?$',
        export, name='existing_data_excel'),
    url(r'^existingdata/exportexcel/team/(?P<pk>\d+)/?$',
        export, name='existing_data_excel'),

    # URLs for Docx export:
    url(r'^existingdata/exportdocx/(?P<pk>\d+)/?$',
        export_doc_single, name='existing_data_docx'),
    url(r'^existingdata/exportdocx/user/(?P<pk>\d+)/?$',
        export, name='existing_data_docx'),
    url(r'^existingdata/exportdocx/team/(?P<pk>\d+)/?$',
        export, name='existing_data_docx'),
    # I don't think this should get hit?
    url(r'^existingdata/exportdocx/?$',
        export, name='existing_data_docx'),


    # Download all attachments for the given datasearch pk
    url(r'^existingdata/download_attachments/(?P<pk>\d+)/?$',
        attachments_download, name='attachments_download_all'),
    # Download a single attachment for the given
    # datasearch pk and attachment id
    url(r'^existingdata/download_attachment/(?P<pk>\d+)/(?P<id>\d+)/?$',
        attachments_download, name='attachment_download'),

    url(r'^existingdata/delete_attachment/(?P<pk>\d+)/(?P<id>\d+)/?$',
        attachment_delete, name='attachment_delete'),


    url(r'^existingdata/create/?$',
        ExistingDataCreate.as_view(),
        name='existing_data_create'),

    url(r'^existingdata/detail/(?P<pk>\d+)/?$',
        ExistingDataDetail.as_view(),
        name='existing_data_detail'),

    url(r'^existingdata/edit/(?P<pk>\d+)/?$',
        ExistingDataEdit.as_view(),
        name='existing_data_edit'),

    url(r'^existingdata/delete/(?P<pk>\d+)/?$',
        ExistingDataDelete.as_view(),
        name='existing_data_delete'),

    # This should be the last existingdata URL.
    url(r'^existingdata/list/user/(?P<pk>\d+)/?$',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),
    url(r'^existingdata/list/team/(?P<pk>\d+)/?$',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),
    url(r'^existingdata/list/?$',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),

    url(r'^existingdata/?$',
        ExistingDataIndex.as_view(),
        name='tracking_tool'),

    # Begin other module import URLs.
    url(r'^accounts/', include('accounts.urls')),
    url(r'^flowsa/', include('flowsa.urls', namespace='flowsa')),
    url(r'^projects/', include('projects.urls')),
    url(r'^qar5/', include('qar5.urls')),
    url(r'^scifinder/', include('scifinder.urls', namespace='scifinder')),
    url(r'^support/', include('support.urls')),
    url(r'^teams/', include('teams.urls')),
]

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)
