# -*- coding: utf-8 -*-

from logging import getLogger
# import json

from django.shortcuts import render_to_response as render, get_object_or_404, redirect
# from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.template import RequestContext as ctx
# from django.views.decorators.cache import cache_page
# from django.views.decorators.csrf import csrf_exempt

from apps.core.util.util import TextTemplateView
from .models import (Bloque, Noticia,Slyder,SliGaleria,Servicio,Promo, Nosotros, Enlaces)
from .forms import ContactoForm, ContactoHomeForm, SuscriptForm
from .util import get_info


log = getLogger('django')


# FRONT END

#def servicio

def home(request, error=None):
    log.info('VIEW: home')

    if request.method == 'POST':
        form = ContactoHomeForm(request.POST)
        if form.is_valid():
            form.save()
            form.enviaEmail()
            print form.errors
        else:
            log.warning('Error de formulario')

    serv = Servicio.objects.active()

    bloque= Bloque.objects.all()
    slyders = Slyder.objects.active().filter(lugar='1')
    enlacez = Enlaces.objects.active()
    response = render('web/home.html', locals(),
        context_instance=ctx(request))

    return response
#basico

def nosotros(request, slug=None):
    log.info('VIEW: home')
    slyders = Slyder.objects.active().filter(lugar='2')
    menu = Nosotros.objects.all()

    if slug:
        nosotros = Nosotros.objects.filter(slug=slug)
        if(slug =='quienes-somos'):
            title = 'Quiénes Somos | Terapias Holísticas en Gaia Spa'
            description = 'Gaia es un centro especializado en servicios de salud integral, con enfoque holístico (cuerpo, mente y espíritu), que nace en el año 2012 en Lima.'
        elif(slug == 'vision-y-mision'):
            title = 'Visión y Misión | Gaia Centro Holístico en Lima'
            description = 'Gaia nace con la misión de brindar tratamientos que ayuden a armonizar y sanar los aspectos del cuerpo físico, social y espiritual.'
        elif(slug == 'inicio'):
            title = 'Nosotros | Reiki, Spa y Masajes en Gaia Centro Holístico'
            description = 'Gaia es un centro de Salud, bienestar y armonia para toda la familia. Ofrecemos geoterapia, spa, masajes, reflexología y variedad de terapias holísticas.'
        else:
            title = ''
            description = ''
    else: 
        title = 'Nosotros | Reiki, Spa y Masajes en Gaia Centro Holístico'
        description = 'Gaia es un centro de Salud, bienestar y armonia para toda la familia. Ofrecemos geoterapia, spa, masajes, reflexología y variedad de terapias holísticas.'
        nosotros = Nosotros.objects.all()
    
    if nosotros.exists():
        nosotros = nosotros[0]

    response = render('web/nosotros.html', locals(),
        context_instance=ctx(request))

    return response

def promociones(request):
    log.info('VIEW: home')

    promos = Promo.objects.active()
    slyders = Slyder.objects.active().filter(lugar='4')
    response = render('web/promociones.html', locals(),
        context_instance=ctx(request))

    return response

def servicios(request):
    log.info('VIEW: home')
    info = get_info()
    servicios = Servicio.objects.active()
    slyders = Slyder.objects.active().filter(lugar='3')
    response = render('web/servicios.html', locals(),
        context_instance=ctx(request))

    return response


def servicios_detalle(request, slug=None):
    log.info('VIEW: home')
    info = get_info()

    servicio = get_object_or_404(Servicio, slug=slug, active=True)
    if servicio.telefono:
        print servicio.telefono+'telf'

    response = render('web/servicio-detalle.html', locals(),
        context_instance=ctx(request))

    return response



def galeria(request):
    log.info('VIEW: home')

    slyders = SliGaleria.objects.active()
    response = render('web/nosotros-galerias.html', locals(),
        context_instance=ctx(request))

    return response

#def enlaces(enlaces)

#agregado

def page_404(request):
    response = render('404.html', locals(),
        context_instance=ctx(request))

    return response


def page_500(request):
    ruta = request.path
    log.warning('Error 500: {0}'.format(ruta))

    return home(request, error=500)


def contacto(request):
    log.info('VIEW: contacto')
    info = get_info()
    if request.method == 'POST':
        form = ContactoForm(request.POST)
        if form.is_valid():
            form.save()
            form.enviaEmail()
        else:
            log.warning('Error de formulario')
    else:
        form = ContactoForm()

    return render('web/contacto.html', locals(),
                  context_instance=ctx(request))

def suscript(request):
    log.info('VIEW: suscripcion')
    #info = get_info()
    if request.method == 'POST':
        form = SuscriptForm(request.POST)

        if form.is_valid():
            form.save()
            return redirect('/suscripcion-enviada/')

        else:
            log.warning('Error de formulario')
            return HttpResponse(form.errors)

        return HttpResponse('ok')

# NOTICIAS
def noticias(request, slug=None):
    if slug:
        noticia = get_object_or_404(Noticia, slug=slug)

        return render('web/noticias-detalle.html', locals(),
                  context_instance=ctx(request))
    else:
        lista_noticias = Noticia.objects.active().order_by('-fecha')
        paginator = Paginator(lista_noticias, 4)
        page = request.GET.get('n')
        try:
            noticias = paginator.page(page)
        except PageNotAnInteger:
            noticias = paginator.page(1)
        except EmptyPage:
            noticias = paginator.page(paginator.num_pages)

        return render('web/noticias.html', locals(),
                  context_instance=ctx(request))


# EXTRA
class RobotsView(TextTemplateView):
    template_name = "extra/robots.txt"

    def get_context_data(self, **kwargs):
        log.info('VIEW: RobotsView')
        return {'url_base': get_info().site}


# TEST
def test(request):
    log.info('VIEW: test')
    log.info('VIEW: test: thumbnail')
    imagen_test = 'test/test.png'

    return render('web/test.html', locals(),
                  context_instance=ctx(request))
