from django.conf.urls import patterns, url

urlpatterns = patterns('apps.core.views',
    # url's cortas
    url(r'^s/(?P<uuid>[-\w]{5})$', 'shortURL', name='shortURL'),
)
