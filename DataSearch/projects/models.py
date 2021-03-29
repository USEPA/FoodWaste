# models.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Models for projects of users.

Available functions:
- Office object
- CenterOffice object
- Division object
- Branch object
- OrdRap object
- Project object allows groups of users to share projects
- Object describing user's membership on a project project
"""

from django.contrib.auth.models import User
from django.db import models
from teams.models import Team


class Office(models.Model):
    """EPA Office."""

    date_created = models.DateTimeField(
        auto_now_add=True, null=True, blank=True)
    last_modified = models.DateTimeField(
        auto_now=True, null=True, blank=True)
    name = models.CharField(null=True, blank=True, max_length=255)
    weblink = models.CharField(blank=True, null=True, max_length=255)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class CenterOffice(models.Model):
    """EPA Center/Office."""

    date_created = models.DateTimeField(
        auto_now_add=True, null=True, blank=True)
    last_modified = models.DateTimeField(
        auto_now=True, null=True, blank=True)
    name = models.CharField(null=True, blank=True, max_length=255)
    weblink = models.CharField(blank=True, null=True, max_length=255)
    description = models.TextField(null=True, blank=True)
    office = models.ForeignKey(
        Office, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class Division(models.Model):
    """EPA Division."""

    date_created = models.DateTimeField(
        auto_now_add=True, null=True, blank=True)
    last_modified = models.DateTimeField(
        auto_now=True, null=True, blank=True)
    name = models.CharField(null=True, blank=True, max_length=255)
    weblink = models.CharField(blank=True, null=True, max_length=255)
    description = models.TextField(null=True, blank=True)
    office = models.ForeignKey(
        Office, on_delete=models.CASCADE, null=True, blank=True)
    center_office = models.ForeignKey(
        CenterOffice, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class Branch(models.Model):
    """EPA Branch."""

    date_created = models.DateTimeField(
        auto_now_add=True, null=True, blank=True)
    last_modified = models.DateTimeField(
        auto_now=True, null=True, blank=True)
    name = models.CharField(null=True, blank=True, max_length=255)
    weblink = models.CharField(blank=True, null=True, max_length=255)
    description = models.TextField(null=True, blank=True)
    office = models.ForeignKey(
        Office, on_delete=models.CASCADE, null=True, blank=True)
    center_office = models.ForeignKey(
        CenterOffice, on_delete=models.CASCADE, null=True, blank=True)
    division = models.ForeignKey(
        Division, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class OrdRap(models.Model):
    """EPA ORD RAP."""

    name = models.CharField(null=True, blank=True, max_length=255)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.name


class Project(models.Model):
    """EPA Project."""

    office = models.ForeignKey(
        Office, on_delete=models.CASCADE, null=True, blank=True)
    center_office = models.ForeignKey(
        CenterOffice, on_delete=models.CASCADE, null=True, blank=True)
    division = models.ForeignKey(
        Division, on_delete=models.CASCADE, null=True, blank=True)
    branch = models.ForeignKey(
        Branch, on_delete=models.CASCADE, null=True, blank=True)
    title = models.CharField(blank=False, max_length=255, db_index=True)
    # Team Members (List of teams related to this project)
    teams = models.ManyToManyField(Team, through='ProjectSharingTeamMap')
    ord_rap = models.ForeignKey(
        OrdRap, on_delete=models.CASCADE, null=True, blank=True)
    created_by = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True,
        related_name='created_by_user')
    project_lead = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True,
        related_name='project_lead_user')
    created_date = models.DateTimeField(auto_now_add=True, null=True,
                                        blank=True, editable=False)
    # When and by whom the team was last modified.
    last_modified_date = models.DateTimeField(auto_now=True, blank=False)

    def save_model(self, request, obj, form, change):
        """
        Overwrite the default save_model method.

        Automatically set the created_by field as current user.
        """
        # Only set prepared_by when it's the first save (create)
        if not obj.pk:
            obj.created_by = request.user
        return super().save_model(request, obj, form, change)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        return self.title


class ProjectSharingTeamMap(models.Model):
    """Mapping between Projects and Teams they share."""

    added_date = models.DateTimeField(
        auto_now_add=True, blank=False, editable=False)
    project = models.ForeignKey(
        Project, blank=False, related_name='project_teams',
        on_delete=models.CASCADE)
    team = models.ForeignKey(
        Team, blank=False, related_name='team_project',
        on_delete=models.CASCADE)
    # Indicates if the team can edit the project.
    can_edit = models.BooleanField(blank=False, default=True)

    def __str__(self):
        """Override str method to display name instead of stringified obj."""
        edit_msg = 'cannot edit'
        if self.can_edit:
            edit_msg = 'can edit'
        return f'Team "{self.team}" {edit_msg} project "{self.project}"'
