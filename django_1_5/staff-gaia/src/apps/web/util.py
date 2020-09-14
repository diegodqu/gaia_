# -*- coding: utf-8 -*-

from logging import getLogger

from .models import InfoSite

log = getLogger('django')


def get_info():
    # Obtiene o crea una instancia de InfoSite en caso de que no exista.

    info = InfoSite.objects.all()
    if info:
        return info[0]
    else:
        info = InfoSite(email_form='desarrollo@email.com',
            telefono='555-5555', direccion='Av. Sin Nombre #123',
            facebook='http://facebook.com/', twitter='http://twitter.com/',
            site='http://127.0.0.1:8000')
        info.save()
        return info
