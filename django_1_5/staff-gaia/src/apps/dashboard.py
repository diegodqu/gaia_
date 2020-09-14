# -*- coding: utf-8 -*-

from django.conf import settings
from django.utils.translation import ugettext_lazy as _

from grappelli.dashboard import modules, Dashboard
from grappelli.dashboard.utils import get_admin_site_name


class CustomIndexDashboard(Dashboard):
    '''
        Custom index dashboard for web
    '''

    def init_with_context(self, context):
        site_name = get_admin_site_name(context)
        ADMIN_URL = settings.ADMIN_URL

        self.children.append(modules.ModelList(
            _('Administracion'),
            column=1,
            collapsible=False,
            models=(
                'django.contrib.*',
                'apps.web.models.Contacto',
                'apps.web.models.SuscripcionPromo',
                'apps.web.models.ContactoHome'
                ),
        ))


        self.children.append(modules.ModelList(
            'Home Page',
            collapsible=False,
            column=1,
            models=['apps.web.models.' + model for model in (
                    'Slyder','Enlaces','Bloque'
                    )]
        ))

        self.children.append(modules.ModelList(
            'Nosotros',
            collapsible=False,
            column=1,
            models=['apps.web.models.' + model for model in (
                    'Nosotros','SliGaleria'
                    )]
        ))

        self.children.append(modules.ModelList(
            'Promociones',
            collapsible=False,
            column=1,
            models=['apps.web.models.' + model for model in (
                    'Promo',
                    )]
        ))

        self.children.append(modules.ModelList(
            'Servicios',
            collapsible=False,
            column=1,
            models=['apps.web.models.' + model for model in (
                    'Servicio','SliGaleria'
                    )]
        ))


        self.children.append(modules.ModelList(
            'Custom Auth',
            collapsible=False,
            column=1,
            models=['apps.custom_auth.models.' + model for model in (
                    'Usuario',
                    )]
        ))

        self.children.append(modules.LinkList(
            u'Información del Sitio',
            collapsible=False,
            column=2,
            children=[
                {
                    'title': 'Configuración',
                    'url': '/{0}/web/infosite/1'.format(ADMIN_URL),
                    'external': False,
                },
            ]
        ))

        self.children.append(modules.LinkList(
           _('Soporte'),
           collapsible=False,
           column=2,
           children=[
               {
                   'title': _('StaffCreativa'),
                   'url': 'http://www.staffcreativa.pe/',
                   'external': False,
               },
               {
                   'title': _('desarrollo@staffcretiva.com'),
                   'url': 'mailto:desarrollo@staffcreativa.com',
                   'external': True,
                   'description': u'Escríbenos',
               },
           ]
       ))

        # append a recent actions module
        self.children.append(modules.RecentActions(
            _('Acciones Recientes'),
            limit=5,
            collapsible=False,
            column=2,
        ))
