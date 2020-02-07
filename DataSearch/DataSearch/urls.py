# urls.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for DataSearch."""

from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include
from DataSearch.views import home, contact, about, ExistingDataIndex, \
    ExistingDataList, ExistingDataCreate, ExistingDataDetail, \
    ExistingDataEdit, export_pdf, export_excel, ProjectPlanCreate, \
    ProjectLeadCreate, ProjectPlanDetail, ProjectApprovalCreate
from DataSearch.settings import MEDIA_ROOT, MEDIA_URL


urlpatterns = [
    url(r'^admin', admin.site.urls),

    url(r'^$', home, name='home'),
    url(r'^dashboard', home, name='dashboard'),
    url(r'^contact', contact, name='contact'),
    url(r'^about', about, name='about'),
    
    # Begin QAPP URLs for creating and printing QAPPs
    url(r'^qapp/create/',
        ProjectPlanCreate.as_view(),
        name='qapp_create'),

    url(r'^qapp/detail/(?P<pk>\d+)/?$',
        ProjectPlanDetail.as_view(),
        name='qapp_create'),

    url(r'^qapp/approval/create/(?P<pk>\d+)/?$',
        ProjectApprovalCreate.as_view(),
        name='qapp_approval'),

    url(r'^qapp/project_lead/create/',
        ProjectLeadCreate.as_view(),
        name='get_project_lead_form'),

    #url(r'^qapp/project_lead/edit/',
    #    ProjectLeadCreate.as_view(),
    #    name='get_project_lead_form'),

    # Begin existingdata URLs.
    # URLs for PDF and Excel exports.
    # downloadattachments
    url(r'^existingdata/exportpdf/(?P<pk>\d+)?$',
        export_pdf, name='existing_data_pdf'),
    url(r'^existingdata/exportexcel/(?P<pk>\d+)?$',
        export_excel, name='existing_data_excel'),
    url(r'^existingdata/exportpdf$',
        export_pdf, name='existing_data_pdf'),
    url(r'^existingdata/exportexcel$',
        export_excel, name='existing_data_excel'),

    url(r'^existingdata/create',
        ExistingDataCreate.as_view(),
        name='existing_data_create'),

    url(r'^existingdata/detail/(?P<pk>\d+)?$',
        ExistingDataDetail.as_view(),
        name='existing_data_detail'),

    url(r'^existingdata/edit/(?P<pk>\d+)?$',
        ExistingDataEdit.as_view(),
        name='existing_data_edit'),

    # This should be the last existingdata URL.
    url(r'^existingdata/list',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),
    url(r'^existingdata/list/user/(?P<pk>\d+)',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),
    url(r'^existingdata/list/team/(?P<pk>\d+)',
        ExistingDataList.as_view(),
        name='tracking_tool_list'),

    url(r'^existingdata',
        ExistingDataIndex.as_view(),
        name='tracking_tool'),

    # Begin other module import URLs.
    url(r'^accounts/', include('accounts.urls')),
    url(r'^support/', include('support.urls')),
    url(r'^teams/', include('teams.urls')),
]

urlpatterns += static(MEDIA_URL, document_root=MEDIA_ROOT)