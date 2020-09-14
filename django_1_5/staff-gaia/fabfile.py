#!/usr/bin/env python
# -*- coding: utf-8 -*-

from functools import wraps
from site import addsitedir
import os.path
import sys

from fabric.api import local, task, env
from fabric.colors import blue, green
from fabric.context_managers import prefix
from fabric.contrib import django

from fab_extras import cron

# Añadimos virtualenv al path
WORKON_HOME = os.environ['WORKON_HOME']
ENV = 'django_1_5'
addsitedir('{0}/{1}/lib/python2.7/site-packages'.format(WORKON_HOME, ENV))

# Añadimos la raiz del proyecto al path
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), 'src'))
sys.path.append(PROJECT_ROOT)

django.settings_module('settings')

env.shell = '/bin/bash'

from django.conf import settings


# VIRTUALENV
def virtualenv():
    '''
        Context manager. Usado para ejecutar acciones con virtualenv activado::

        with virtualenv():
            # virtualenv está activo aquí
    '''

    return prefix('export ENV="{0}";. $WORKON_HOME/$ENV/bin/activate'.format(ENV))


def inside_virtualenv(func):
    '''
        Decorador, usado para ejecutar acciones con virtualenv activado::

        @task
        @inside_virtualenv
        def my_command():
            # virtualenv está activo aquí
    '''
    @wraps(func)
    def inner(*args, **kwargs):
        with virtualenv():
            return func(*args, **kwargs)
    return inner


# TAREAS
@task
@inside_virtualenv
def cache():
    '''
        Crea la tabla para la cache
    '''
    print(blue('::cache::'))
    local('./src/manage.py createcachetable cache_table')
    print(green('::::cache()::::'))


@task
def media():
    '''
        Crea los subdirectorios para los archivos MEDIA
    '''
    print(blue('::media()::'))
    MEDIA_ROOT = fix_media_root()
    # imagen de no-disponible
    media_mkdir('no-disponible')
    local('cp src/static/images/logo.png'
          ' {0}no-disponible/no-disponible.png'.format(MEDIA_ROOT))
    # imagen de test
    media_mkdir('test')
    local('cp src/static/images/logo.png {0}test/test.png'.format(MEDIA_ROOT))
    # directorio uploads
    media_mkdir('uploads')
    media_mkdir('uploads/noticias')
    media_mkdir('uploads/productos')
    print(green('::::media()::::'))


@task
def memcached():
    '''
        Copia el script que reinicia memcached y lo añade como un cronjob.
    '''
    print(blue('::memcached()::'))
    local('mkdir -p ~/scripts')
    local('cp extra/memcached_usage.sh ~/scripts/memcached_usage.sh')
    cron_line = '*/5 * * * * cd ~/scripts;./memcached_usage.sh > /dev/null 2>&1'
    cron.update_line(cron_line, 'memcached')
    print(green('::::memcached()::::'))


@task
@inside_virtualenv
def migrate():
    '''
        Ejecuta las migraciones
    '''
    print(blue('::migrate::'))
    local('./src/manage.py migrate')
    reversion()
    print(green('::::migrate()::::'))


@task
def pep8():
    '''
        Crea la revisiones iniciales de los modelos.
    '''
    print(blue('::pep8()::'))
    local('pep8 --config setup.cfg .')
    print(green('::::pep8()::::'))


@task
@inside_virtualenv
def reversion():
    '''
        Crea la revisiones iniciales de los modelos.
    '''
    print(blue('::reversion()::'))
    local('./src/manage.py createinitialrevisions')
    print(green('::::reversion()::::'))


@task
@inside_virtualenv
def static(extra=''):
    '''
        Ejecuta el comando collectstatic

        extra: '' o 'prod'
    '''
    print(blue('::static()::'))
    if extra == 'prod':
        local('./src/manage.py collectstatic --noinput --settings=settings.production')
        pep8()
    else:
        local('./src/manage.py collectstatic --noinput')
    print(green('::::static()::::'))


@task
@inside_virtualenv
def test(extra=''):
    '''
        Ejecuta los test's
    '''
    print(blue('::test()::'))
    media()  # inicializamos  los media
    if extra == 'dev':
        local('./src/manage.py test --settings=settings.dev')
        pep8()
    else:
        local('./src/manage.py test')
    print(green('::::test()::::'))


########
# UTIL #
########

def fix_media_root():
    '''
        Se asegura que la ruta MEDIA_ROOT termine en un slash:

            void -> str
    '''
    MEDIA_ROOT = settings.MEDIA_ROOT
    if not MEDIA_ROOT[-1] == '/':
        MEDIA_ROOT = MEDIA_ROOT + '/'
    return MEDIA_ROOT


def media_mkdir(ruta):
    '''
        Crea un subdirectorio respecto a MEDIA_ROOT
        str -> void
    '''
    MEDIA_ROOT = fix_media_root()
    local('mkdir -p {0}{1}'.format(MEDIA_ROOT, ruta))
