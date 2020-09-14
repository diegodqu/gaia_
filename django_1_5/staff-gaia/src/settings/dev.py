'''
    settings for development
'''

# settings/base.py

from base import *

INSTALLED_APPS += (
    'debug_toolbar',
    'django_extensions'
)

MIDDLEWARE_CLASSES = (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
) + MIDDLEWARE_CLASSES


## nosetest settings
NOSE_ARGS = [
    '--cover-package=apps.web,apps.core',
    '--with-coverage',
    '--cover-html',
    '--cover-erase'
]
