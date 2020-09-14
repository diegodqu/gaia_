# -*- coding: utf-8 -*-
from logging import getLogger

from django.forms import Form, ModelForm
from django.template.loader import get_template
from django.template import Context
from django.core.mail import EmailMessage
from django.conf import settings

#from captcha.fields import ReCaptchaField

from .models import Contacto, ContactoHome, SuscripcionPromo
from .util import get_info


log = getLogger('django')
global STATIC_URL
STATIC_URL = settings.STATIC_URL


class ContactoForm(ModelForm):
    class Meta:
        model = Contacto
        fields = ('nombres', 'telefono', 'email', 'mensaje')

    def enviaEmail(self):
        htmly = get_template('web/email-contacto.html')
        info = get_info()
        c_d = self.cleaned_data
        c_d['STATIC_URL'] = (info.site + STATIC_URL)
        c_d['info'] = info
        d = Context(c_d)

        html_content = htmly.render(d)
        asunto = u"Web: Contacto"
        mail = '{0}<{1}>'.format(settings.PROJECT_NAME,
            settings.DEFAULT_FROM_EMAIL)
        msg = EmailMessage(asunto, html_content, mail,
                           [info.email_form], ['webmaster@staffcreativa.pe'],)
        msg.content_subtype = "html"
        msg.send()

class ContactoHomeForm(ModelForm):
    class Meta:
        model = ContactoHome
        fields = ('nombres', 'telefono', 'email', 'servicio')

    def enviaEmail(self):
        htmly = get_template('web/email-contactohome.html')
        info = get_info()
        c_d = self.cleaned_data
        c_d['STATIC_URL'] = (info.site + STATIC_URL)
        c_d['info'] = info
        d = Context(c_d)

        html_content = htmly.render(d)
        asunto = u"Web: Contacto"
        mail = '{0}<{1}>'.format(settings.PROJECT_NAME,
            settings.DEFAULT_FROM_EMAIL)
        msg = EmailMessage(asunto, html_content, mail,
                           [info.email_form], ['webmaster@staffcreativa.pe'],)
        msg.content_subtype = "html"
        msg.send()


class SuscriptForm(ModelForm):
    class Meta:
        model = SuscripcionPromo
        #fields = ('nombres', 'telefono', 'email', 'mensaje')
