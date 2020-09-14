# -*- coding: utf-8 -*-

from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

from filebrowser.sites import site


admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include('admin_honeypot.urls')),
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^{0}/filebrowser/'.format(settings.ADMIN_URL), include(site.urls)),
    url(r'^{0}/'.format(settings.ADMIN_URL), include(admin.site.urls)),

    # STATIC / MEDIA
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': settings.STATIC_ROOT}),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': settings.MEDIA_ROOT}),

    # CORE
    url(r'', include('apps.core.urls')),
    # WEB
    url(r'', include('apps.web.urls')),
    # AUTH
    # url(r'^auth/', include('apps.custom_auth.urls', 'custom_auth')),
)

handler404 = 'apps.web.views.page_404'
handler500 = 'apps.web.views.page_500'
