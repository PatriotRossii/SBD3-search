import os 

import pytest
from rest_framework.test import APIClient
from django.conf import settings


def make_client():
    client = APIClient()

    return client


@pytest.fixture
def user():
    return make_client()


@pytest.fixture(scope='session')
def django_db_setup():
    settings.DATABASES['default'] = {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get("DATABASE_NAME", "homework"),
        'USER': os.environ.get("DATABASE_USER", "user"),
        'PASSWORD': os.environ.get("DATABASE_PASSWORD", "random"),
        'HOST': os.environ.get("DATABASE_HOST", "store"),
        'PORT': os.environ.get("DATABASE_PORT", "5432"),
    }
