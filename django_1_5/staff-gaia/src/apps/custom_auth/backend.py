# -*- coding: utf-8 -*-
from datetime import datetime
from logging import getLogger

from .models import Usuario

log = getLogger('django')


class CustomAuthBackend(object):
    log.info('CLASS: CustomAuthBackend')

    def authenticate(self, username=None, password=None):
        try:
            user = Usuario.objects.get(email=username)
        except Usuario.DoesNotExist:
            log.error(u'El email no es válido')
            return None
        pwd_valid = user.check_password(password)

        if pwd_valid:
            user.last_login = datetime.now()
            user.save()
            return user
        log.error(u'La contraseña es incorrecta')
        return None

    def get_user(self, username):
        log.info('get_user: {0}'.format(username))
        try:
            return Usuario.objects.get(id=username)
        except Usuario.DoesNotExist:
            log.error('El usuario no existe')
            return None
