 # -*- coding: utf-8 -*-

## IMPORTS
from datetime import date
from logging import getLogger
from urlparse import urlparse

from django.conf import settings
from django.contrib.sites.models import Site
from django.core.urlresolvers import reverse
from django.db import models

from ...core.models import AuditableModel, SlugModel
from filebrowser.fields import FileBrowseField
from mptt.models import MPTTModel, TreeForeignKey

log = getLogger('django')


class InfoSite(AuditableModel):
    email = models.EmailField('Email de Contacto', blank=True)
    email_form = models.EmailField('Email de Formularios', blank=True)
    fijo = models.CharField('Teĺéfono (fijo)', max_length=50, blank=True)
    telefono = models.CharField('Teĺéfono:', max_length=50, blank=True)
    direccion = models.CharField('Dirección', max_length=120)

    site = models.CharField("URL del sitio", max_length=60, blank=True,
        help_text='Ingrese la url actual del sitio sin el slash final')
    facebook = models.URLField('Facebook', blank=True)
    twitter = models.URLField('Twitter', blank=True)

    titulo = models.CharField("Título", max_length=40, blank=True,
        help_text='Título base mostrado en el navegador')
    description = models.TextField('Descripción', blank=True, help_text='''
        Descripción usada para facilitar la indexación de parte de los
        buscadores''')

    ga = models.CharField('Google Analytics', max_length=24, blank=True,
       help_text='''Opcional: Inserte el código que google analitycs le
       proporciona con el formato: UA-XXXXX-X''')
    coordenadas = models.CharField('Coordenadas', max_length=48,
       help_text='Se recomienda usar: http://maps.rogerca.com')

    def __unicode__(self):
        return u'Información del Sitio'

    class Meta:
        verbose_name_plural = u'Información del Sitio'

    def save(self, *args, **kwargs):
        site = Site.objects.get(id=settings.SITE_ID)
        site.domain = urlparse(self.site).netloc
        site.name = settings.PROJECT_NAME
        site.save()

        if not self.titulo:
            self.titulo = settings.PROJECT_NAME

        super(InfoSite, self).save(*args, **kwargs)


# NOTICIAS
class Noticia(SlugModel, AuditableModel):
    fecha = models.DateField('Fecha de Publicación', default=date.today())
    detalle = models.TextField('Detalle', blank=True)
    portada = FileBrowseField('Imagen de Portada', max_length=200,
        directory='noticias/', extensions=['.jpg', '.png', '.gif'])

    class Meta:
        verbose_name = u'Noticia'
        verbose_name_plural = u'Noticias'
        ordering = ['-fecha']

    def get_absolute_url(self):
        return reverse('noticias_detalle', kwargs={'slug': self.slug})


# CATEGORÍAS Y PRODUCTOS
class Categoria(MPTTModel, SlugModel, AuditableModel):
    parent = TreeForeignKey('self', verbose_name='Padre', null=True,
        blank=True, related_name='children')

    class Meta:
        verbose_name_plural = 'Categorías'


class Producto(SlugModel, AuditableModel):
    categoria = models.ForeignKey(Categoria, related_name='productos')
    imagen = FileBrowseField('Imagen', max_length=200,
        directory='productos/', extensions=['.jpg', '.png', '.gif'])

    class Meta:
        verbose_name = u'Producto'
        verbose_name_plural = u'Productos'
        ordering = ['nombre']


# FORMULARIOS

class Contacto(models.Model):
    fecha = models.DateTimeField('Fecha', auto_now_add=True)
    nombres = models.CharField('Nombres', max_length=120)
    telefono = models.CharField('Telefono', max_length=120)
    email = models.EmailField('Email')
    mensaje = models.TextField('Asunto')

    class Meta:
        verbose_name = u'Contacto'
        verbose_name_plural = u'Contacto'
        ordering = ['-fecha']

    def __unicode__(self):
        return '{0}: {1}'.format(self.email, self.fecha.date())


class SuscripcionPromo(models.Model):
    fecha = models.DateTimeField('Fecha', auto_now_add=True)
    email = models.EmailField('Email')

    class Meta:
        verbose_name = u'Suscriptor'
        verbose_name_plural = u'Suscriptores'
        ordering = ['-fecha']

    def __unicode__(self):
        return '{0}: {1}'.format(self.email, self.fecha.date())


class ContactoHome(models.Model):
    fecha = models.DateTimeField('Fecha', auto_now_add=True)
    nombres = models.CharField('Nombres', max_length=120)
    telefono = models.CharField('Telefono', max_length=120)
    email = models.EmailField('Email')
    servicio = models.CharField('Servicio', max_length=120, blank=True)

    class Meta:
        verbose_name = u'Contacto Home'
        verbose_name_plural = u'Contactos Home'
        ordering = ['-fecha']

    def __unicode__(self):
        return '{0}: {1}'.format(self.email, self.fecha.date())


# Home //Pagina Principal
class Slyder(AuditableModel):
    LUGAR_CHOICES = (
        ('1', 'Home'),
        ('2', 'Nosotros'),
        ('3', 'Servicios'),
        ('4', 'Promociones'),
    )
    imagen = FileBrowseField('Imagen', max_length=200,
        directory='slyders/', extensions=['.jpg', '.png', '.gif']) 
    lugar = models.CharField(max_length=1,
                             choices=LUGAR_CHOICES)
    posicion = models.IntegerField("Orden", default=1)


    class Meta:
        verbose_name = u'Slider'
        verbose_name_plural = u'Sliders'
        ordering = ['posicion']

    def __unicode__(self):
        return "Slide"

class Enlaces(AuditableModel):
    titulo = models.CharField("Título", max_length=38, blank=True,)
    enlace = models.URLField('Link', blank=True)
    posicion = models.IntegerField("Orden", default=1)
    class Meta:
        verbose_name = u'Enlace'
        verbose_name_plural = u'Enlaces'
        ordering = ['posicion']

    def __unicode__(self):
        return self.titulo

class Bloque(models.Model):
    nombre1 = models.CharField('Pie de Imágen', max_length=120)
    nombre2 = models.CharField('Texo en imágen', max_length=120)
    titulo = models.CharField("Título de Descripción", max_length=40)
    descripcion = models.TextField('Descripción', max_length=120)
    telefono =  models.CharField('Teléfono', max_length=120)
    imagen1 = FileBrowseField('Imágen', max_length=200,
        directory='bloques/servicio', extensions=['.jpg', '.png', '.gif'])
    imagen2 = FileBrowseField('Imágen Principal', max_length=200,
        directory='bloques/descripcion', extensions=['.jpg', '.png', '.gif']) 
    posicion = models.IntegerField("Orden", default=1)


    class Meta:
        verbose_name = u'Bloque'
        verbose_name_plural = u'Bloques'
        ordering = ['posicion']

    def __unicode__(self):
        return self.nombre1

##Nosotros//Page 2

class Nosotros(SlugModel):
    descripcion = models.TextField('texto', max_length=500)
    posicion = models.IntegerField("Orden", default=1)
    
    class Meta:
        verbose_name = u'Nosotros'
        verbose_name_plural = u'Nosotros'
        ordering = ['posicion']
    def __unicode__(self):
        return "Nosotros"




## Servicios // Page 3
class Servicio(AuditableModel, SlugModel):
    seo_titulo = models.CharField('Titulo SEO', max_length=120, blank=True)
    seo_descript = models.CharField('Descripción SEO', max_length=320, blank=True)
    nombre1 = models.CharField('Pie de imágen', max_length=120)
    # nombre = models.CharField('Título', max_length=120)
    descripcion = models.TextField('Descripción', max_length=120)
    telefono =  models.CharField('Teléfono (adicional)', max_length=120, blank=True)
    logo = FileBrowseField('Logo de servicio', max_length=200, directory='servicios/logos', extensions=['.jpg', '.png', '.gif'],blank=True) 
    imagen1 = FileBrowseField('Imágen', max_length=200, directory='servicios/listado', extensions=['.jpg', '.png', '.gif']) 
    imagen2 = FileBrowseField('Imagen Principal', max_length=200,
        directory='servicios/detalle', extensions=['.jpg', '.png', '.gif']) 
    posicion = models.IntegerField("Orden", default=1)


    class Meta:
        verbose_name = u'Servicio'
        verbose_name_plural = 'Servicios'
        ordering = ['posicion']

    def __unicode__(self):
        return self.nombre

## Promociones // Page 4

class Promo(AuditableModel):  
    nombre = models.CharField('Nombre (referencia)', max_length=120)
    imagen1 = FileBrowseField('Imágen', max_length=200,
        directory='Promociones/listado', extensions=['.jpg', '.png', '.gif']) 
    imagen2 = FileBrowseField('Imagen Principal', max_length=200,
        directory='Promociones/detalle', extensions=['.jpg', '.png', '.gif']) 
    posicion = models.IntegerField("Orden", default=1)


    class Meta:
        verbose_name = u'Promoción'
        verbose_name_plural = 'Promociones'
        ordering = ['posicion']

    def __unicode__(self):
        return self.nombre

## Nosotros-Galerias

class SliGaleria(AuditableModel):
    imagen = FileBrowseField('Imagen', max_length=200,
        directory='infraestructura/', extensions=['.jpg', '.png', '.gif']) 
    posicion = models.IntegerField("Orden", default=1)

    class Meta:
        verbose_name = u'Galeria'
        verbose_name_plural = u'Galerias'
        ordering = ['posicion']

    def __unicode__(self):
        return "Slider"
