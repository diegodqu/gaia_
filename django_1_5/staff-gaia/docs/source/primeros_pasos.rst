Primeros pasos
==============

El proyecto requiere django 1.5 y las dependencias mostradas en el siguiente apartado.

Requerimientos
--------------

Los requerimientos se encuentran en el directorio **requirements**, el cual contiene los archivos:

- base.txt:
    - django>=1.5,<1.5.99
    - django-grappelli>=2.4,<=2.4.99
    - django-filebrowser>=3.5,<=3.5.99
    - django-admin-honeypot
    - django-compressor
    - django-mptt
    - django-mptt-admin
    - django-nose
    - django-reversion
    - django-uuslug
    - fabric
    - johnny-cache
    - pillow
    - psycopg2
    - python-memcached
    - raven
    - south


- dev.txt:
    - django-debug-toolbar
    - django-extensions
    - werkzeug
    - sphinx
    - pep8
    - coverage


- extra.txt
    - django-recaptcha
    - python-markdown


Instalación:
------------

Según se requiera::

    pip install requirements/base.txt

    pip install requirements/dev.txt

    pip install requirements/extra.txt
