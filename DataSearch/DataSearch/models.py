# models.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=C0301,E1101,W0611,C0411


"""Definition of models."""

from django.db import models
from django.utils import timezone
from constants.utils import get_attachment_storage_path, upload_storage
from teams.models import Team, User


class Attachment(models.Model):
    """Class representing a file attachment to an Existing Data entry."""

    name = models.CharField(blank=False, null=False, max_length=255)
    file = models.FileField(null=True, blank=True,
                            upload_to=get_attachment_storage_path,
                            storage=upload_storage)
    uploaded_by = models.ForeignKey(User, blank=False,
                                    on_delete=models.CASCADE)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class ExistingDataSource(models.Model):
    """Model containing options for the data source dropdown."""

    name = models.CharField(blank=False, null=False, max_length=255)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class ExistingData(models.Model):
    """Class representing an instance of Existing Data Tracking Tool."""

    work = models.CharField(blank=False, null=False, max_length=255)
    email = models.CharField(blank=False, null=False, max_length=255)
    phone = models.CharField(blank=False, null=False, max_length=32)
    search = models.CharField(blank=False, null=False, max_length=255)

    source = models.ForeignKey(ExistingDataSource,
                               blank=False, null=False,
                               related_name='existing_data_sources',
                               on_delete=models.CASCADE)

    source_title = models.CharField(blank=True, null=True, max_length=255)
    keywords = models.CharField(blank=True, null=True, max_length=1024)
    url = models.CharField(blank=True, null=True, max_length=255)

    # Indicates if EPA disclaimer should be included when printing/exporting
    # this data.
    disclaimer_req = models.BooleanField(blank=False)

    # TODO: Consider using this tool to auto-generate a basic citation.
    # https://github.com/thenaterhood/python-autocite
    # Require users to double-check the generated citation before continuing
    citation = models.CharField(blank=False, null=False, max_length=2048)

    date_accessed = models.DateTimeField(blank=False, null=False,
                                         default=timezone.now)
    comments = models.CharField(blank=True, null=True, max_length=2048)
    created_by = models.ForeignKey(User, blank=False, on_delete=models.CASCADE)
    # List of teams with which the Existing Data is shared.
    teams = models.ManyToManyField(Team, through='ExistingDataSharingTeamMap')
    attachments = models.ManyToManyField(Attachment,
                                         through='DataAttachmentMap')

    def get_fields(self):
        """Return an iterable to display all fields."""
        return [(field.name, field.value_to_string(self))
                for field in ExistingData._meta.fields]

    def __str__(self):
        """Override str method to display source instead of stringified obj."""
        return self.source_title


class DataAttachmentMap(models.Model):
    """Mapping between Existing Data and uploaded attachments."""

    data = models.ForeignKey(ExistingData, blank=False,
                             related_name='existing_data_attachments',
                             on_delete=models.CASCADE)
    attachment = models.ForeignKey(Attachment, blank=False,
                                   related_name='attachment_existing_data',
                                   on_delete=models.CASCADE)


class ExistingDataSharingTeamMap(models.Model):
    """Mapping between Existing Data and Teams they share."""

    added_date = models.DateTimeField(
        auto_now_add=True, blank=False, editable=False)
    data = models.ForeignKey(ExistingData, blank=False,
                             related_name='existing_data_teams',
                             on_delete=models.CASCADE)
    team = models.ForeignKey(Team, blank=False,
                             related_name='team_existing_data',
                             on_delete=models.CASCADE)
    # Indicates if the team can edit the project.
    can_edit = models.BooleanField(blank=False)

    class Meta:
        """Defines the fields Data and Team as unique together."""

        unique_together = ('data', 'team')
