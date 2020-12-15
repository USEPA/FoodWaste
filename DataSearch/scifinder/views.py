# views.py (scifinder)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=C0301,E1101,R0901,W0613,W0622,C0411


"""Definition of views."""

from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView, DeleteView
from constants.utils import download_file, download_files
from scifinder.forms import UploadForm
from scifinder.models import Upload


class ScifinderIndex(LoginRequiredMixin, TemplateView):
    """
    Class to return the main scifinder page.

    Along with a list of all scifinder uploaded files available to this user as
    well as a form for uploading new scifinder files. This class also handles
    the POSTs for new file uploads.
    """

    template_name = 'scifinder.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """
        Return a view with an empty form.

        For uploading new scifinder files in addition to a list of scifinder
        files available to the current user.
        """
        files_list = Upload.objects.filter(uploaded_by=request.user)
        return render(request, self.template_name,
                      {'form': UploadForm(), 'files': files_list})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new scifinder file upload."""
        form = UploadForm(request.POST, self.request.FILES)
        if form.is_valid():
            file = form.save(commit=False)
            file.uploaded_by = request.user
            file.name = file.file.name
            file.save()
            data = {'is_valid': True, 'name': file.name,
                    'download_url': '/scifinder/download_file/%s' % file.id,
                    'delete_url': '/scifinder/delete_file/%s' % file.id}
        else:
            data = {'is_valid': False}

        return JsonResponse(data)


class ScifinderDelete(LoginRequiredMixin, DeleteView):
    """Class for deleting previously uploaded files."""

    model = Upload
    template_name = 'scifinder_upload_confirm_delete.html'
    success_url = reverse_lazy('scifinder:scifinder_index')

    def dispatch(self, *args, **kwargs):
        """Delete the Upload only if the requesting user is allowed."""
        pk = kwargs.get('pk')
        instance = Upload.objects.filter(id=pk).first()
        if instance:
            user = self.request.user
            if instance.uploaded_by == user or user.is_superuser:
                return super().dispatch(*args, **kwargs)
        return HttpResponseRedirect(self.success_url)


def scifinder_download(request, *args, **kwargs):
    """Download a previously uploaded file."""
    upload_id = kwargs.get('pk', None)
    if upload_id is None:
        # Export all uploads for this user:
        file_list = Upload.objects.filter(uploaded_by=request.user)
        zip_name = '%s_scifinder_uploads' % request.user.username
        return download_files(file_list, zip_name)

    else:
        # Export the upload specified, if it belongs to the user:
        file = Upload.objects.get(id=upload_id)

        if file.uploaded_by == request.user:
            return download_file(file)

    return HttpResponse(request)
