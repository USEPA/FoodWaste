﻿# models.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=E1101,R0903

"""
Models related to users and profiles.

Available functions:
- Manager class to facilitate natural key lookups when loading initial data.
- Enumerated type for countries.
- Enumerated type list of states (by country).
- Enumerated type for industry sectors (academia, government, etc.).
- Enumerated type for employee roles (ex. manager, scientist, etc.).
- Profile information associated with a User object.
"""

from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save


def get_profile_photo_storage_path(instance, filename):
    return 'profiles/%s/%s' %(instance.user.id, filename)


class CountryBaseManager(models.Manager):
    """
    CountryBaseManager.

    Manager class to facilitate natural key lookups when
    loading initial data.
    """

    def get_by_natural_key(self, country):
        """
        :param country:
        :return:
        """
        return self.get(country=country)


class Country(models.Model):
    """Enumerated type for countries."""

    country = models.CharField(null=True, blank=True, max_length=255)
    abbreviation = models.CharField(blank=False, max_length=4)
    flag = models.CharField(null=True, blank=True, max_length=255)

    objects = CountryBaseManager()

    def natural_key(self):
        """
        :return:
        """
        # NOTE: DO NOT REMOVE THE PARENTHESES, IT BREAKS MIGRATIONS
        return (self.country,)

    def __str__(self):
        """Request country."""
        return self.country


class State(models.Model):
    """Enumerated type list of states (by country)."""

    state = models.CharField(blank=False, max_length=255)
    abbreviation = models.CharField(blank=False, max_length=4)
    country = models.ForeignKey(
        Country, null=True, blank=True, on_delete=models.CASCADE)

    def __str__(self):
        """Method to stringify a State."""
        return self.state


class Sector(models.Model):
    """Enumerated type for industry sectors (academia, government, etc.)."""

    sector = models.CharField(blank=True, null=True, max_length=255)

    def natural_key(self):
        """
        :return:
        """
        # NOTE: DO NOT REMOVE THE PARENTHESES, IT BREAKS MIGRATIONS
        return (self.sector,)

    def __str__(self):
        """Method to stringify a Sector."""
        return self.sector


class Role(models.Model):
    """Enumerated type for employee roles (ex. manager, scientist, etc.)."""

    role = models.CharField(blank=True, null=True, max_length=255)

    def natural_key(self):
        """
        :return:
        """
        # NOTE: DO NOT REMOVE THE PARENTHESES, IT BREAKS MIGRATIONS
        return (self.role,)

    def __str__(self):
        """Method to stringify a Role."""
        return self.role


class UserProfile(models.Model):
    """Profile information associated with a User object."""

    user = models.OneToOneField(User, blank=False, on_delete=models.CASCADE)

    # Created/modified info
    created = models.DateTimeField(auto_now_add=True, blank=False,
                                   editable=False)
    last_modified = models.DateTimeField(auto_now=True, blank=False)

    # Affiliation and job information
    affiliation = models.CharField(blank=True, null=True, max_length=255)
    sector = models.ForeignKey(Sector, null=True, blank=True,
                               on_delete=models.CASCADE)
    job_title = models.CharField(blank=True, null=True, max_length=255)
    role = models.ForeignKey(Role, null=True, blank=True,
                             on_delete=models.CASCADE)

    # Address
    address_line1 = models.CharField(blank=True, null=True, max_length=255)
    address_line2 = models.CharField(blank=True, null=True, max_length=255)
    city = models.CharField(blank=True, null=True, max_length=255)
    state = models.ForeignKey(State, null=True, blank=True,
                              on_delete=models.CASCADE)
    zipcode = models.CharField(blank=True, null=True, max_length=255)
    country = models.ForeignKey(Country, null=True, blank=True,
                                on_delete=models.CASCADE)

    # New fields from QATRACK profile, seemingly required for projects
    email_address_epa = models.CharField(
        blank=True, null=True, max_length=255)
    email_address_other = models.CharField(
        blank=True, null=True, max_length=255)
    is_reviewer = models.CharField(
        blank=True, null=True, max_length=5, choices=YN_CHOICES)
    is_technical_lead = models.CharField(
        blank=True, null=True, max_length=5, choices=YN_CHOICES)
    can_edit = models.CharField(
        blank=True, null=True, max_length=5, choices=YN_CHOICES)
    can_create_users = models.CharField(
        blank=True, null=True, max_length=5, choices=YN_CHOICES)
    display_in_dropdowns = models.CharField(
        default='Y', max_length=2, choices=YN_CHOICES, db_index=True)
    date_epa_separation = models.DateField(
        null=True, blank=True, db_index=True)
    permissions = models.CharField(
        blank=False, null=False, max_length=45,
        choices=PERMISSION_CHOICES, default="READER")

    def __str__(self):
        """Method to stringify a User Profile."""
        return self.user.last_name + ', ' + self.user.first_name


# These calls create a user profile object whenever a user is created
def create_user_profile(sender, instance, created, **kwargs):
    # py-lint: disable=unused-argument
    """
    Function to create associated user profile whenever a new user is created.

    :param sender:
    :param instance:
    :param created:
    :param kwargs:
    :return:
    """
    if created:
        UserProfile.objects.create(user=instance)


# Register the create profile function with the user save handler
post_save.connect(create_user_profile, sender=User)
