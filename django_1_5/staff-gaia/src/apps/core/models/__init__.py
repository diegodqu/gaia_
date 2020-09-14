# -*- coding: utf-8 -*-

from logging import getLogger
from uuid import uuid4

from django.core.urlresolvers import reverse
from django.db import models

from uuslug import uuslug

from .managers import ActiveInactiveManager

log = getLogger('django')


class AuditableModel(models.Model):
    active = models.BooleanField('Activo', default=True)
    created = models.DateTimeField(editable=False, auto_now_add=True)
    modified = models.DateTimeField(editable=False, auto_now=True)
    created_by = models.IntegerField('Creado por', editable=False, null=True,
                                     default=0)
    modified_by = models.IntegerField('Modificado por', editable=False,
                                      null=True, default=0)

    objects = ActiveInactiveManager()

    class Meta:
        abstract = True


class SlugModel(models.Model):
    nombre = models.CharField('Nombre', max_length=120)
    slug = models.SlugField('slug', max_length=180, blank=True)

    class Meta:
        abstract = True

    def __unicode__(self):
        return self.nombre

    def save(self, *args, **kwargs):
        self.slug = uuslug(self.nombre, instance=self)
        super(SlugModel, self).save(*args, **kwargs)


class ShortURL(models.Model):
    '''
        Modelo que almacena url's y sus versiones cortas
    '''
    url = models.CharField('URL Normal', max_length=250)
    uuid = models.CharField('URL Corta', max_length=5, default='')
    fecha = models.DateTimeField('Fecha', auto_now_add=True)
    visitas = models.IntegerField('Visitas', default=0)

    def save(self, *args, **kwargs):
        if not self.uuid:
            self.uuid = str(uuid4())[:5]
        super(ShortURL, self).save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('shortURL', kwargs={'uuid': self.uuid})
