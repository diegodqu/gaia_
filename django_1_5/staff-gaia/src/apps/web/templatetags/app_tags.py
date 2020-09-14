# -*- coding: utf-8 -*-

from django import template
from apps.web.util import get_info

register = template.Library()


# HEADER
@register.inclusion_tag('web/header.html')
def header():
    info = get_info()

    return locals()


# FOOTER
@register.inclusion_tag('web/footer.html')
def footer():
    info = get_info()

    return locals()
