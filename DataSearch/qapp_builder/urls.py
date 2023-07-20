# urls.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of urls for qapp_builder."""

from django.urls import path
from qapp_builder.views import QappList
# from qapp_builder.qapp_docx import export_doc, export_doc_single
# from qapp_builder.qapp_pdf import export_pdf, export_pdf_single


urlpatterns = [
    path('', QappList.as_view(), name='qapp'),

    # # Single QAPP Exports (if user has access, owner or team):
    # path('exportdoc/<int:pk>/?$', export_doc_single, name='qapp_doc'),
    # path('exportpdf/<int:pk>/?$', export_pdf_single, name='qapp_pdf'),

    # # All QAPP Exports for User:
    # path('exportdoc/user/<int:pk>/?$', export_doc, name='qapp_all_doc'),
    # path('exportpdf/user/<int:pk>/?$', export_pdf, name='qapp_all_pdf'),

    # # All QAPP Exports for Team:
    # path('exportdoc/team/<int:pk>/?$', export_doc, name='qapp_all_doc'),
    # path('exportpdf/team/<int:pk>/?$', export_pdf, name='qapp_all_pdf'),
]
