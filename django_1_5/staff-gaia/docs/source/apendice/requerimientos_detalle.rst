Requerimientos a detalle:
-------------------------

django-grappelli
````````````````
Skin para el admin de django.

Documentación: `grappelli`_


django-filebrowser
``````````````````
Gestor de archivos *media* con integración para *django-grappelli*.

Documentación: `filebrowser`_


django-admin-honeypot
`````````````````````
Fake del login de django, utilizado para prevenir accesos no autorizados.

Documentación: `admin honeypot`_


django-compressor
`````````````````````
Une y comprime archivos css/js.

Documentación: `django-compressor`_


django-mptt
```````````
Utilidades para implementar MPTT (técnica para almacenar contenido jerárquico en una base de datos). En nuestro caso se utiliza para manejar el modelo ``Categoria``.

Documentación: `django-mptt`_


django-mptt-admin
`````````````````
Integración con el *admin* para *django-mptt*.

Repositorio: `django-mptt-admin`_


django-nose
```````````
Extensión que integra *nose* con django.
`nose`_ es un paquete que extiende *unittest*.

Repositorio: `django-nose`_


django-reversion
````````````````
Extensión que permite implementar un control de versiones para nuestros *models*.

Documentación: `reversion`_


django-uuslug
`````````````
Genera `slugs`_ únicos (sin preocuparnos por textos unicode).

Repositorio: `uuslug`_


fabric
``````
Herramienta de línea de comandos que permite automatizar tareas.

Documentación: `fabric`_


jhony-cache
```````````
Almacena automáticamente en la caché los querysets realizados.

Documentación: `jhony-cache`_


pillow
``````
Fork de "Python Imaging Library"

Documentación: `pillow`_


psycopg2
````````
Conector de base de datos para *postgresql*.

Documentación: `psycopg2`_


python-memcached
````````````````
Interfaz en python para memcached.


raven
`````
Cliente para `sentry`_.
Sentry es una plataforma de registro de eventos en tiempo real (logging). Monitoriza y extrae información de los errores sucedidos en nuestras aplicaciones.

Documentación: `raven`_


south
`````
Extensión que permite el manejo de migraciones de esquemas y datos en django.

Documentación: `south`_




django-debug-toolbar
````````````````````
Conjunto de paneles configurables que muestran información variada del debug del *request* o *response* actual.

Documentación: `django-debug-toolbar`_


django-extensions
`````````````````
Colección de utilidades para django. Entre sus comandos destacan:

- ``manage.py shell_plus``: una versión mejorada de la shell de django. Importa automáticamente los *models* de nuestras aplicaciones.
- ``manage.py runscript``: Ejecuta un script en el contexto de nuestro proyecto en django.
- ``manage.py runserver_plus``: Lanza el servidor estándar pero con el debugger de `werkzeug`_ (requiere *werkzeug*)

Documentación: `django extensions`_


werkzeug
````````
Colección de utilidades para wsgi (web server gateway interface).

Documentación: `werkzeug`_


sphinx
``````
Herramienta que permite generar documentación de manera sencilla

Documentación: `sphinx`_


pep8
````
Herramienta que se utiliza para verificar que código python cumpla los estándares `PEP8`_.

Documentación: `pep8_docs`_


coverage
````````
Herramienta que mide que tantas líneas en cantidad relativa se utilizan al ejecutar el programa.
Se utiliza para revisar que tanto cubren nuestros test.

Home: `coverage`_




django-recaptcha
````````````````
Paquete que integra `reCAPTCHA`_ con los formularios de *django*.

Repositorio: `django-recaptcha`_




.. _grappelli: https://django-grappelli.readthedocs.org/en/2.4.8/
.. _filebrowser: https://django-filebrowser.readthedocs.org/en/3.5.2/
.. _admin honeypot: https://django-admin-honeypot.readthedocs.org/
.. _django-compressor: http://django-compressor.readthedocs.org/
.. _django-mptt: http://django-mptt.github.io/django-mptt/
.. _django-mptt-admin: https://github.com/leukeleu/django-mptt-admin/
.. _django-nose: https://github.com/jbalogh/django-nose
.. _uuslug: https://github.com/un33k/django-uuslug/

.. _fabric: http://docs.fabfile.org/
.. _jhony-cache: http://pythonhosted.org/johnny-cache/
.. _pillow: http://pillow.readthedocs.org/en/latest/
.. _postgresql: http://pythonhosted.org/psycopg2/
.. _reversion: http://django-reversion.readthedocs.org/
.. _raven: http://raven.readthedocs.org/
.. _sentry: http://sentry.readthedocs.org/
.. _south: http://south.readthedocs.org/


.. _django-debug-toolbar: http://django-debug-toolbar.readthedocs.org/
.. _django extensions: http://django-extensions.readthedocs.org/
.. _coverage: http://nedbatchelder.com/code/coverage/
.. _pep8_docs: http://pep8.readthedocs.org/en/latest/
.. _sphinx: http://sphinx-doc.org/
.. _werkzeug: http://werkzeug.pocoo.org/docs/

.. _django-recaptcha: https://github.com/praekelt/django-recaptcha


.. _`slugs`: http://en.wikipedia.org/wiki/Slug_(web_publishing)
.. _`reCAPTCHA`: http://www.google.com/recaptcha
.. _`nose`: https://nose.readthedocs.org/en/latest/
.. _`PEP8`: http://www.python.org/dev/peps/pep-0008/