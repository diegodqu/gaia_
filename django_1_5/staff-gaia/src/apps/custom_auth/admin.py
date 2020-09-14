# -*- coding: utf-8 -*-

from django.contrib import admin

from .models import Usuario


class UsuarioAdmin(admin.ModelAdmin):
    model = Usuario
    list_display = ('email',)


admin.site.register(Usuario, UsuarioAdmin)
