# -*- coding: utf-8 -*-

from logging import getLogger

from django.http import Http404
from django.shortcuts import get_object_or_404, redirect


from .models import ShortURL

log = getLogger('django')


# url's cortas
def shortURL(request, uuid):
    '''
        Redirecciona desde la url corta a la url objetivo y cuenta la visita.
    '''
    # log.info('VIEW: shortURL')
    if uuid:
        url = get_object_or_404(ShortURL, uuid=uuid)
        url.visitas = url.visitas + 1
        url.save()
    else:
        raise Http404

    return redirect(url.url)
