# urls.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for qapp_builder."""

from django.urls import re_path
from qapp_builder.views import QappCreate, QappDetail, ProjectApprovalCreate, \
    ProjectLeadCreate, ProjectApprovalSignatureCreate, SectionAView, \
    SectionBView, SectionCView, SectionDView, SectionEView, SectionFView, \
    RevisionCreate, QappList, QappEdit, QappIndex, ProjectApprovalEdit, \
    ProjectApprovalSignatureDelete, ProjectApprovalSignatureEdit, \
    ProjectLeadDelete, ProjectLeadEdit
from qapp_builder.qar5_docx import export_doc, export_doc_single
from qapp_builder.qar5_pdf import export_pdf, export_pdf_single


urlpatterns = [
    re_path(r'^$', QappIndex.as_view(), name='qapp_index'),
    # URLs for CRUD operations.

    re_path(r'^create/?$',
            QappCreate.as_view(),
            name='qapp_create'),

    re_path(r'^detail/(?P<pk>\d+)/?$',
            QappDetail.as_view(),
            name='qapp_detail'),

    re_path(r'^edit/(?P<pk>\d+)/?$',
            QappEdit.as_view(),
            name='qapp_edit'),

    re_path(r'^list/user/(?P<pk>\d+)/?$',
            QappList.as_view(),
            name='qapp_list'),
    re_path(r'^list/team/(?P<pk>\d+)/?$',
            QappList.as_view(),
            name='qapp_list'),

    # Single QAPP Exports (if user has access, owner or team):
    re_path(r'^exportdoc/(?P<pk>\d+)/?$',
            export_doc_single, name='qar5_doc'),
    re_path(r'^exportpdf/(?P<pk>\d+)/?$',
            export_pdf_single, name='qar5_pdf'),
    # re_path(r'^exportexcel/(?P<pk>\d+)/?$',
    #         export_excel_single, name='qar5_excel'),

    # All QAPP Exports for User:
    re_path(r'^exportdoc/user/(?P<pk>\d+)/?$',
            export_doc, name='qar5_all_doc'),
    re_path(r'^exportpdf/user/(?P<pk>\d+)/?$',
            export_pdf, name='qar5_all_pdf'),
    # re_path(r'^exportexcel/user/(?P<pk>\d+)/?$',
    #         export_excel, name='qar5_all_excel'),

    # All QAPP Exports for Team:
    re_path(r'^exportdoc/team/(?P<pk>\d+)/?$',
            export_doc, name='qar5_all_doc'),
    re_path(r'^exportpdf/team/(?P<pk>\d+)/?$',
            export_pdf, name='qar5_all_pdf'),
    # re_path(r'^exportexcel/team/(?P<pk>\d+)/?$',
    #         export_excel, name='qar5_all_excel'),

    ############################################
    # Project Approval (and signatures) URLs
    re_path(r'^approval/create/?$',
            ProjectApprovalCreate.as_view(),
            name='qapp_approval'),

    re_path(r'^approval/edit/(?P<pk>\d+)/?$',
            ProjectApprovalEdit.as_view(),
            name='qapp_approval_edit'),

    # Project Approval Signatures URLs
    re_path(r'^approval_signature/create/?$',
            ProjectApprovalSignatureCreate.as_view(),
            name='get_approval_signature_form'),

    re_path(r'^approval_signature/delete/(?P<pk>\d+)/?$',
            ProjectApprovalSignatureDelete.as_view(),
            name='delete_approval_signature'),

    re_path(r'^approval_signature/edit/(?P<pk>\d+)/?$',
            ProjectApprovalSignatureEdit.as_view(),
            name='edit_approval_signature'),

    ############################################
    # Project Lead URLs
    re_path(r'^project_lead/create/?$',
            ProjectLeadCreate.as_view(),
            name='get_project_lead_form'),

    re_path(r'^project_lead/delete/(?P<pk>\d+)/?$',
            ProjectLeadDelete.as_view(),
            name='delete_project_lead'),

    re_path(r'^project_lead/edit/(?P<pk>\d+)/?$',
            ProjectLeadEdit.as_view(),
            name='edit_project_lead'),

    ############################################
    # SectionB URLs
    re_path(r'^SectionA/?$', SectionAView.as_view(), name='qapp_sectiona'),
    re_path(r'^SectionB/?$', SectionBView.as_view(), name='qapp_sectionb'),
    re_path(r'^SectionC/?$', SectionCView.as_view(), name='qapp_sectionc'),
    re_path(r'^SectionD/?$', SectionDView.as_view(), name='qapp_sectiond'),
    re_path(r'^SectionE/?$', SectionEView.as_view(), name='qapp_sectione'),
    re_path(r'^SectionF/?$', SectionFView.as_view(), name='qapp_sectionf'),

    # Revision is part of Section F
    re_path(r'^revision/create/?$',
            RevisionCreate.as_view(),
            name='create_revision'),
]
