# qar5_pdf.py (qar5)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of qar5 pdf export views."""

from io import BytesIO
import tempfile
from wkhtmltopdf.views import PDFTemplateResponse
from zipfile import ZipFile
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
from django.template.loader import get_template
from qar5.views import get_qapp_info, get_qar5_for_team, get_qar5_for_user


@login_required
def export_pdf(request, *args, **kwargs):
    """Function to export multiple QAR5 objects as PDF documents."""
    template_name = 'export/qar5_pdf_template.html'
    template = get_template(template_name)
    if 'user' in request.path:
        user_id = kwargs.get('pk', None)
        team_id = qapp_id = None
    elif 'team' in request.path:
        team_id = kwargs.get('pk', None)
        user_id = qapp_id = None
    else:
        qapp_id = kwargs.get('pk', None)
        team_id = user_id = None

    if qapp_id is None or user_id or team_id:
        if user_id:
            qapp_ids = get_qar5_for_user(
                user_id).values_list('id', flat=True)
        else:
            qapp_ids = get_qar5_for_team(
                team_id).values_list('id', flat=True)

        # Create a zip archive to return multiple PDFs
        zip_mem = BytesIO()
        archive = ZipFile(zip_mem, 'w')
        for id in qapp_ids:
            resp = export_pdf_single(request, pk=id)
            filename = resp.filename
            if filename:
                temp_file_name = '%d_%s' % (id, filename)
                resp.render()
                with tempfile.SpooledTemporaryFile() as tmp:
                    archive.writestr(temp_file_name, resp.content)

        archive.close()
        response = HttpResponse(
            zip_mem.getvalue(), content_type='application/force-download')
        response['Content-Disposition'] = \
            'attachment; filename="%s_qapps.zip"' % request.user.username
        response['Content-length'] = zip_mem.tell()
        return response


def export_pdf_single(request, *args, **kwargs):
    """Function to export a single QAR5 object as a PDF document."""
    template_name = 'export/qar5_pdf_template.html'
    # Get all required data before populating the PDF Export Template

    # TODO: Rewrite this method to check if user has access via
    # ownership, super status, or team membership
    qapp_id = kwargs.get('pk', None)
    qapp_info = get_qapp_info(request.user, qapp_id)

    if not qapp_info:
        return HttpResponse(request)

    filename = '%s.pdf' % qapp_info['qapp'].title
    resp = PDFTemplateResponse(
        request=request,
        template=template_name,
        filename=filename,
        context=qapp_info,
        show_content_in_browser=False,
        cmd_options={},
    )
    return resp
