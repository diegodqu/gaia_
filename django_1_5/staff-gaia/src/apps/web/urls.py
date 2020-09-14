from django.conf.urls import patterns, url
from django.views.generic import TemplateView

from .views import RobotsView
# from .sitemaps import sitemaps, sitemap_view

urlpatterns = patterns('apps.web.views',
    # FRONT - END
    url(r'^$', 'home', name='home'),
    url(r'^contacto-enviado/$', 'home', name='env_contact'),
    url(r'^home-contacto-enviado/$', 'home', name='env_home_contact'),
    url(r'^suscripcion-enviada/$', 'home', name='env_suscript'),
    url(r'^novedades/$', 'home', name='novedades'),

    url(r'^promociones/$', 'promociones', name='promociones'),
    url(r'^nosotros/$', 'nosotros', name='nosotros'),
    url(r'^nosotros/(?P<slug>[-\w]+)/$', 'nosotros', name='nosotros_seccion'),
   # url(r'^bloque/$', 'bloque', name='bloque'),
    url(r'^suscript/$', 'suscript', name='suscript'),
    url(r'^servicios/$', 'servicios', name='servicios'),
    url(r'^servicios/(?P<slug>[-\w]+)/$', 'servicios_detalle', name='servicios_detalle'),
    url(r'^contacto/$', 'contacto', name='contacto'),
    url(r'^galeria/$', 'galeria', name='galeria'),


    url(r'^noticias/$', 'noticias', name='noticias'),
    url(r'^noticias/(?P<slug>[-\w]+)/$', 'noticias', name='noticias_detalle'),

    # EXTRA
    url(r'^robots\.txt$', RobotsView.as_view(), name='robots'),

    # TEST
    url(r'^test/$', 'test', name='test')
)


# EXTRA
urlpatterns = urlpatterns + patterns('',
    # url(r'^sitemap\.xml$', sitemap_view, {'sitemaps': sitemaps}),

    url(r'^humans\.txt$',
        TemplateView.as_view(template_name='extra/humans.txt',
        content_type='text/plain'), name='humans'),

    url(r'^sitemap\.xml$',
        TemplateView.as_view(template_name='extra/sitemap.xml',
        content_type='application/xml')),

    url(r'^BingSiteAuth\.xml$',
        TemplateView.as_view(template_name='extra/BingSiteAuth.xml',
        content_type='application/xml')),

    url(r'^google87ca650136e188c0\.html$',
        TemplateView.as_view(template_name='extra/google87ca650136e188c0.html',
        content_type='text/html')),
)
