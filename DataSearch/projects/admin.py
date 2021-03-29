# admin.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Define classes used to generate Django Admin portion of the website.

Available functions:
- Sets Projects
- Sets Project Memberships
"""

from django.contrib import admin
from projects.models import Branch, CenterOffice, Division, Office, \
    OrdRap, Project, ProjectSharingTeamMap

admin.site.register(Office)

admin.site.register(CenterOffice)

admin.site.register(Division)

admin.site.register(Branch)

admin.site.register(OrdRap)

admin.site.register(Project)

admin.site.register(ProjectSharingTeamMap)
