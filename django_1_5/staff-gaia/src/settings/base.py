# -*- coding: utf-8 -*-

import sys
from os.path import dirname, join, realpath
from .util import get_env

SITE_ROOT = dirname(dirname(realpath(__file__)))

ENV = get_env(SITE_ROOT)

PROJECT_NAME = 'Gaia'

DEBUG = True
TEMPLATE_DEBUG = DEBUG
HOME = ENV.get('HOME')

ADMINS = (
    ('usuario', 'usuario@server.com'),
)

MANAGERS = ADMINS

# EMAIL

EMAIL_HOST = ENV.get('APP_EMAIL_HOST')
EMAIL_HOST_USER = ENV.get('APP_EMAIL_HOST_USER_LOGIN')
EMAIL_HOST_PASSWORD = ENV.get('APP_EMAIL_PASSWORD')
DEFAULT_FROM_EMAIL = ENV.get('APP_EMAIL_HOST_USER')
SERVER_EMAIL = ENV.get('APP_EMAIL_HOST_USER')

# DB
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': ENV.get('APP_DB'),
        'USER': ENV.get('APP_USER'),
        'PASSWORD': ENV.get('APP_PASSWORD'),
        'HOST': 'localhost',
        'PORT': '',
    }
}


SECRET_KEY = 'my_super_secret_key'
# utilizada para almacenar las claves de CustomAuthBackend
AUTH_SECRET_KEY = SECRET_KEY

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
    # 'apps.custom_auth.backend.CustomAuthBackend',
)

ALLOWED_HOSTS = ['127.0.0.1']
XS_SHARING_ALLOWED_ORIGINS = ALLOWED_HOSTS
XS_SHARING_ALLOWED_METHODS = ''

TIME_ZONE = 'America/Lima'
LANGUAGE_CODE = 'es-pe'
SITE_ID = 1

USE_I18N = True
USE_L10N = True
USE_TZ = False


# ADMIN, MEDIA y STATIC
ADMIN_URL = 'admin-staff'

MEDIA_ROOT = join(SITE_ROOT, 'media')
MEDIA_URL = '/media/'

STATIC_ROOT = ''
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    join(SITE_ROOT, 'static'),
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder',
)

# Para normalizar nombres de archivo en formato ASCII en vez de Unicode
DEFAULT_FILE_STORAGE = 'apps.core.util.storage.ASCIIFileSystemStorage'


TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'django.contrib.messages.context_processors.messages',
    'django.core.context_processors.request',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'apps.core.util.crossdomainxhr.XsSharing'
)

USE_ETAGS = True

ROOT_URLCONF = 'urls'

WSGI_APPLICATION = 'wsgi.application'

TEMPLATE_DIRS = (
    join(SITE_ROOT, 'templates'),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.sitemaps',
    'django.contrib.sites',
    'django.contrib.staticfiles',
    ## admin
    'grappelli.dashboard',
    'grappelli',
    'filebrowser',
    'django.contrib.admin',
    ## external apps
    'south',
    'django_nose',
    'admin_honeypot',
    'mptt',
    'django_mptt_admin',
    'reversion',
    'compressor',
    # 'raven.contrib.django.raven_compat',
    # 'captcha',
    ## local apps
    'apps.core',
    'apps.web',
    # 'apps.custom_auth'
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'formatters': {
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(message)s'
        },
    },
    'handlers': {
        'null': {
            'level': 'DEBUG',
            'class': 'django.utils.log.NullHandler',
        },
        'console': {
            'level': 'DEBUG',
            'class': 'apps.core.util.log.ColorizingStreamHandler',
            'formatter': 'simple'
        }
    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'propagate': True,
            'level': 'INFO',
        }
    }
}


# CACHE
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.db.DatabaseCache',
        'LOCATION': 'cache_table',
        'TIMEOUT': '300',
    }
}


## Grappelli settings
# http://django-grappelli.readthedocs.org/en/2.4.6/customization.html
GRAPPELLI_ADMIN_TITLE = '<a href="/" target="_blank">Administrador</a>'
GRAPPELLI_INDEX_DASHBOARD = 'apps.dashboard.CustomIndexDashboard'


## FileBrowser settings
FILEBROWSER_MAX_UPLOAD_SIZE = 26214400  # 25 MB
FILEBROWSER_NORMALIZE_FILENAME = True
FILEBROWSER_OVERWRITE_EXISTING = False
FILEBROWSER_LIST_PER_PAGE = 25

FILEBROWSER_SHOW_PLACEHOLDER = True
FILEBROWSER_PLACEHOLDER = 'no-disponible/no-disponible.png'


## compress settings
COMPRESS_ENABLED = True

COMPRESS_CSS_FILTERS = ['compressor.filters.css_default.CssAbsoluteFilter',
                        'compressor.filters.cssmin.CSSMinFilter']


## nosetest settings
TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'


if 'test' in sys.argv:
    DATABASES['default'] = {'ENGINE': 'django.db.backends.sqlite3'}

    CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
        }
    }


# django-recaptcha
# RECAPTCHA_PUBLIC_KEY = ''
# RECAPTCHA_PRIVATE_KEY = ''


# admin-honeypot
# ADMIN_HONEYPOT_EMAIL_ADMINS = False
