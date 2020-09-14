# urls.py (qar5)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
URLs related to managing Products.

Available functions:
- None yet
"""

from django.conf.urls import url
from qar5.views import QappCreate, QappDetail, ProjectApprovalCreate, \
    ProjectLeadCreate, ProjectApprovalSignatureCreate, SectionAView, \
    SectionBView, SectionCView, SectionDView, SectionEView, SectionFView, \
    RevisionCreate, QappList, QappEdit, QappIndex, ProjectApprovalEdit, \
    ProjectApprovalSignatureDelete, ProjectApprovalSignatureEdit,  \
    ProjectLeadDelete, ProjectLeadEdit
from qar5.qar5_docx import export_doc, export_doc_single
from qar5.qar5_excel import export_excel, export_excel_single
from qar5.qar5_pdf import export_pdf, export_pdf_single

urlpatterns = [
    url(r'^$', QappIndex.as_view(), name='qapp_index'),
    # URLs for CRUD operations.
    # Begin QAPP URLs for creating and printing QAPPs
    # url(r'^list/?$',
    #     QappList.as_view(),
    #     name='qapp_list'),

    url(r'^create/?$',
        QappCreate.as_view(),
        name='qapp_create'),

    url(r'^detail/(?P<pk>\d+)/?$',
        QappDetail.as_view(),
        name='qapp_detail'),

    url(r'^edit/(?P<pk>\d+)/?$',
        QappEdit.as_view(),
        name='qapp_edit'),

    url(r'^list/user/(?P<pk>\d+)/?$',
        QappList.as_view(),
        name='qapp_list'),
    url(r'^list/team/(?P<pk>\d+)/?$',
        QappList.as_view(),
        name='qapp_list'),

    # Single QAPP Exports (if user has access, owner or team):
    url(r'^exportdoc/(?P<pk>\d+)/?$',
        export_doc_single, name='qar5_doc'),
    url(r'^exportpdf/(?P<pk>\d+)/?$',
        export_pdf_single, name='qar5_pdf'),
    url(r'^exportexcel/(?P<pk>\d+)/?$',
        export_excel_single, name='qar5_excel'),

    # All QAPP Exports for User:
    url(r'^exportdoc/user/(?P<pk>\d+)/?$',
        export_doc, name='qar5_all_doc'),
    url(r'^exportpdf/user/(?P<pk>\d+)/?$',
        export_pdf, name='qar5_all_pdf'),
    url(r'^exportexcel/user/(?P<pk>\d+)/?$',
        export_excel, name='qar5_all_excel'),

    # All QAPP Exports for Team:
    url(r'^exportdoc/team/(?P<pk>\d+)/?$',
        export_doc, name='qar5_all_doc'),
    url(r'^exportpdf/team/(?P<pk>\d+)/?$',
        export_pdf, name='qar5_all_pdf'),
    url(r'^exportexcel/team/(?P<pk>\d+)/?$',
        export_excel, name='qar5_all_excel'),

    ############################################
    # Project Approval (and signatures) URLs
    url(r'^approval/create/?$',
        ProjectApprovalCreate.as_view(),
        name='qapp_approval'),

    url(r'^approval/edit/(?P<pk>\d+)/?$',
        ProjectApprovalEdit.as_view(),
        name='qapp_approval_edit'),

    # Project Approval Signatures URLs
    url(r'^approval_signature/create/?$',
        ProjectApprovalSignatureCreate.as_view(),
        name='get_approval_signature_form'),

    url(r'^approval_signature/delete/(?P<pk>\d+)/?$',
        ProjectApprovalSignatureDelete.as_view(),
        name='delete_approval_signature'),

    url(r'^approval_signature/edit/(?P<pk>\d+)/?$',
        ProjectApprovalSignatureEdit.as_view(),
        name='edit_approval_signature'),

    ############################################
    # Project Lead URLs
    url(r'^project_lead/create/?$',
        ProjectLeadCreate.as_view(),
        name='get_project_lead_form'),

    url(r'^project_lead/delete/(?P<pk>\d+)/?$',
        ProjectLeadDelete.as_view(),
        name='delete_project_lead'),

    url(r'^project_lead/edit/(?P<pk>\d+)/?$',
        ProjectLeadEdit.as_view(),
        name='edit_project_lead'),

    ############################################
    # SectionB URLs
    url(r'^SectionA/?$', SectionAView.as_view(), name='qapp_sectiona'),
    url(r'^SectionB/?$', SectionBView.as_view(), name='qapp_sectionb'),
    url(r'^SectionC/?$', SectionCView.as_view(), name='qapp_sectionc'),
    url(r'^SectionD/?$', SectionDView.as_view(), name='qapp_sectiond'),
    url(r'^SectionE/?$', SectionEView.as_view(), name='qapp_sectione'),
    url(r'^SectionF/?$', SectionFView.as_view(), name='qapp_sectionf'),

    # Revision is part of Section F
    url(r'^revision/create/?$',
        RevisionCreate.as_view(),
        name='create_revision'),
]
