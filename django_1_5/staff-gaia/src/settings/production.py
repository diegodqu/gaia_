'''
    settings for production
'''

# settings/base.py

from base import *

DEBUG = False

PREPEND_WWW = False

# Se recomienda: http://www.miniwebtool.com/django-secret-key-generator/
SECRET_KEY = ENV.get('APP_SECRET_KEY')

# NO CAMBIAR DESDE SU USO EN PRODUCCION!!
# SOLO SI SE USA CUSTOM_AUTH
# AUTH_SECRET_KEY = ENV.get('AUTH_SECRET_KEY')


# DIRS

MEDIA_ROOT = ENV.get('APP_MEDIA')
MEDIA_URL = '/media/'

STATIC_ROOT = ENV.get('APP_STATIC')
STATIC_URL = '/static/'


# EMAIL

#EMAIL_HOST = 'smtp.webfaction.com'
#EMAIL_HOST_USER = ENV.get('APP_EMAIL_HOST_USER')
#EMAIL_HOST_PASSWORD = ENV.get('APP_EMAIL_PASSWORD')
#DEFAULT_FROM_EMAIL = ENV.get('APP_EMAIL_HOST_USER_EMAIL')
#SERVER_EMAIL = ENV.get('APP_EMAIL_HOST_USER_EMAIL')

#EMAIL_PORT = 587
#EMAIL_USE_TLS = True


# SESSIONS

SESSION_EXPIRE_AT_BROWSER_CLOSE = True


# CROSS DOMAIN XHR

ALLOWED_HOSTS = ['gaiamedicinaalternativa.com', 'www.gaiamedicinaalternativa.com','gaiacentroholistico.pe','www.gaiacentroholistico.pe']
XS_SHARING_ALLOWED_ORIGINS = ALLOWED_HOSTS
XS_SHARING_ALLOWED_METHODS = 'GET, POST'


# CACHE
# CACHE_PREFIX = 'project_name'  # usar un identificador valido

# CACHES = {
#     'default': {
#         'BACKEND':  'johnny.backends.memcached.MemcachedCache',
#         'LOCATION': 'unix:{0}/tmp/memcached.sock'.format(HOME),
#         'TIMEOUT': 15 * 60,
#         'OPTIONS': {
#             'MAX_ENTRIES': 1000,
#             'CULL_FREQUENCY': 3,
#             'KEY_PREFIX': CACHE_PREFIX
#         },
#         'JOHNNY_CACHE': True
#     }
# }

# JOHNNY_MIDDLEWARE_KEY_PREFIX = 'jhony' + CACHE_PREFIX

# MIDDLEWARE_CLASSES = (
#     'johnny.middleware.LocalStoreClearMiddleware',
#     'johnny.middleware.QueryCacheMiddleware',
# ) + MIDDLEWARE_CLASSES

RAVEN_CONFIG = {
    'dsn': 'http://d2f1316c4781441292c0c0bf4bf13030:f360bc7203e2405a9bdffd49e0cb2966@sentry.devstaff.webfactional.com/30',
}

PREPEND_WWW = True
