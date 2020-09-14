# -*- coding: utf-8 -*-

## IMPORTS
from pbkdf2 import crypt
from logging import getLogger
from uuid import uuid4
import re

from django.conf import settings
from django.db import models

log = getLogger('django')

SECRET_KEY = settings.AUTH_SECRET_KEY
SALT = ''.join(re.findall("[a-zA-Z0-9]+", SECRET_KEY))


class Usuario(models.Model):
    is_active = models.BooleanField('¿Activo?', default=True, blank=True)
    last_login = models.DateTimeField('Último Login', blank=True, null=True)
    email = models.EmailField('Email', blank=True)
    password = models.CharField('Contraseña', max_length=96, default='',
        blank=True)

    set_password = models.BooleanField('Contraseña usable', default=False)
    uuid_hash = models.CharField('UUID', max_length=36, default='', blank=True)

    def __unicode__(self):
        return unicode(self.email)

    class Meta:
        verbose_name = u'Usuario'
        verbose_name_plural = u'Usuarios'

    def save(self, *args, **kwargs):
        if self.uuid_hash == '':
            self.uuid_hash = str(uuid4())
        if self.set_password is False:
            self.password = make_password(self.password)
            self.set_password = True
        super(Usuario, self).save(*args, **kwargs)

    def check_password(self, password):
        return check_password_helper(password, self.password)

    def is_authenticated(self):
        return True

    @property
    def is_staff(self):
        return False


# HELPERS
def make_password(password):
    return crypt(password, SALT, 500)


def check_password_helper(password, encoded):
    return make_password(password) == encoded
