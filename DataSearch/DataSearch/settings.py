# settings.py (DataSearch)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=unused-wildcard-import


"""
Django settings for DataSearch project.

Based on 'django-admin startproject' using Django 2.1.2.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

SITE_NAME = 'https://134.67.216.106/accounts/login'

EMAIL_DISCLAIMER = '<p style="font-weight:bold;color:red">Please do not reply to this email. Thank you.</p>'  # noqa
EMAIL_DISCLAIMER_PLAIN = 'Please do not reply to this email. Thank you.'
BCC_EMAIL = ''

SUPPORT_EMAIL = [
    'young.daniel@epa.gov',
]

USER_APPROVAL_EMAIL = [
    'young.daniel@epa.gov',
    'meyer.david@epa.gov',
    'gonzalez.michael@epa.gov',
]

WKHTMLTOPDF_CMD_OPTIONS = {
    'quiet': True,
}
if os.name != 'nt':
    WKHTMLTOPDF_CMD = '/usr/local/bin/wkhtmltopdf'
else:
    WKHTMLTOPDF_CMD = 'C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe'

# Quick-start development settings - unsuitable for production.
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/.

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '5d1c445a-e8d6-481f-b1ce-ce0a51e096c3'

# SECURITY WARNING: do not run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application references
# https://docs.djangoproject.com/en/2.1/ref/settings/#std:setting-INSTALLED_APPS
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    # Add your apps here to enable them.
    'accounts',
    'constants',
    'DataSearch',
    'flowsa',
    'projects',
    'scifinder',
    'qar5',
    'support',
    'teams',
    'phonenumber_field',
]

# Middleware framework.
# https://docs.djangoproject.com/en/2.1/topics/http/middleware/.
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'DataSearch.urls'
APPEND_SLASH = False

# Template configuration.
# https://docs.djangoproject.com/en/2.1/topics/templates/.
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'DataSearch.context_processors.software_info',
            ],
        },
    },
]

WSGI_APPLICATION = 'DataSearch.wsgi.application'
# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases.

# Password validation.
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators.
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',  # noqa
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',  # noqa
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',  # noqa
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',  # noqa
    },
]

# Internationalization.
# https://docs.djangoproject.com/en/2.1/topics/i18n/.
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'America/New_York'
DATETIME_FORMAT = '%m/%d/%Y %H:%M'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images).
# https://docs.djangoproject.com/en/2.1/howto/static-files/.
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'DataSearch', 'static')

DOWNLOADS_DIR = os.path.join(BASE_DIR, '..', 'docs')
MANUAL_NAME = 'K-LRTD-0032360-QM-1-0.docx'
# EXCEL_TOOL = ''

MEDIA_ROOT = os.path.join(BASE_DIR, 'DataSearch/media')
MEDIA_URL = '/media/'

# We keep upload root separate from STATIC and MEDIA to keep it more secure.
# UPLOAD_ROOT will not be accessible from URL, only by the server views.
UPLOAD_ROOT = os.path.join(MEDIA_ROOT, 'uploads')

FILE_UPLOAD_PERMISSIONS = 0o644

ENABLE_RSS_FEEDS = False

APP_NAME = 'ExistingData'
APP_VERSION = '1.0.0'
APP_DISCLAIMER = 'The information and data presented in this product ' + \
                 'were obtained from sources that are believed to be ' + \
                 'reliable. However, in many cases the quality of the ' + \
                 'information or data was not documented by those ' + \
                 'sources; therefore, no claim is made regarding ' + \
                 'their quality.'

try:
    from .local_settings import *
    # py-lint: disable=E0012
except ImportError:
    pass
