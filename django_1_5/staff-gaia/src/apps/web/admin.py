# -*- coding: utf-8 -*-

from django.conf import settings
from django.contrib import admin
from django.contrib.sites.models import Site
from django.contrib.auth.models import Group
# from django.contrib.auth.admin import UserAdmin

from django_mptt_admin.admin import DjangoMpttAdmin
from reversion import VersionAdmin

from .models import (SliGaleria, Promo, Nosotros, Categoria, Bloque, Enlaces, Contacto, ContactoHome, SuscripcionPromo, InfoSite, Noticia, Producto, Slyder, Servicio)
from filebrowser.settings import ADMIN_THUMBNAIL
from apps.core.actions import export_as_csv_action


# tinymce
STATIC_URL = settings.STATIC_URL
js_tiny = [
    '{0}grappelli/tinymce/jscripts/tiny_mce/tiny_mce.js'.format(STATIC_URL),
    '{0}grappelli/tinymce_setup/tinymce_setup.js'.format(STATIC_URL),
]


# INFOSITE / BANNER
# class InfoSiteAdmin(admin.ModelAdmin):
class InfoSiteAdmin(VersionAdmin):
    model = InfoSite
    fieldsets = (
        ('', {'fields': ('email', 'email_form', 'telefono', 'fijo', 'direccion')}),
        ('Social', {'fields': ('facebook', 'twitter','coordenadas')}),
        ('Site/SEO', {'fields': ('site', 'titulo', 'description', 'ga')})
    )

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


# SECCIONES
class ProductoAdmin(VersionAdmin):
    model = Producto
    fields = ['nombre', 'categoria', 'imagen']
    list_display = ['nombre', 'categoria']
    # raw_id_fields = ['categoria']
    search_fields = ['nombre']
    actions = [export_as_csv_action()]


class ProductoInline(admin.TabularInline):
    model = Producto
    sortable_field_name = 'nombre'
    fields = ('nombre', 'imagen')
    extra = 0


class CategoriaAdmin(DjangoMpttAdmin):
    model = Categoria
    list_display = ['nombre', 'parent']
    search_fields = ['nombre']
    inlines = [ProductoInline]
    fields = ('active', 'nombre', 'parent')

    tree_auto_open = 0


# Otros
class ContactoAdmin(admin.ModelAdmin):
    model = Contacto
    #readonly_fields = ('fecha', 'nombres', 'apellidos', 'email', 'asunto')
    data = ['nombres','telefono', 'email','fecha']
    list_display = ('nombres', 'telefono', 'email','fecha')
    list_per_page = 20
    search_fields = ('email', 'nombres')
    actions = [export_as_csv_action('Exportar Excel',data)]

class ContactoHomeAdmin(admin.ModelAdmin):
    model = ContactoHome
    #readonly_fields = ('fecha', 'nombres', 'apellidos', 'email', 'asunto')
    data = ['nombres','telefono','email','fecha']
    list_display = ('nombres', 'telefono', 'email', 'servicio', 'fecha')
    list_per_page = 20
    search_fields = ('email', 'nombres')
    actions = [export_as_csv_action('Exportar Excel',data)]

class SuscripcionPromoAdmin(admin.ModelAdmin):
    model = SuscripcionPromo
    #readonly_fields = ('fecha', 'nombres', 'apellidos', 'email', 'asunto')
    data = ['email','fecha']
    list_display = ('email',)
    list_per_page = 20
    search_fields = ('email',)
    actions = [export_as_csv_action('Exportar Excel de Suscriptores',data)]


class BloqueAdmin(admin.ModelAdmin):
    model = Bloque
    list_display = ("miniatura", "posicion")
    fields = ('imagen1','posicion')

    def miniatura(self, obj):
        if obj.imagen1 and obj.imagen1.filetype == "Image":
            return u'<img src="%s" />' % obj.imagen1.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Imágen"
    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


class NosotrosAdmin(admin.ModelAdmin):
    model = Nosotros
    list_display = ("nombre",'posicion')
    fields = ('nombre','descripcion','posicion')

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    class Media:
        js = js_tiny

class NoticiaAdmin(admin.ModelAdmin):
    model = Noticia
    fields = ('nombre', 'fecha', 'portada', 'detalle')
    list_display = ['nombre', 'fecha', 'miniatura']
    list_filter = ['fecha']
    ordering = ['-fecha']

    def miniatura(self, obj):
        if obj.portada and obj.portada.filetype == "Image":
            return u'<img src="%s" />' % obj.portada.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Miniatura"

    class Media:
        js = js_tiny


class SlyderAdmin(admin.ModelAdmin):
    model = Slyder
    list_display = ("lugar","miniatura", "posicion", "active")
    list_per_page = 8

    def miniatura(self, obj):
        if obj.imagen and obj.imagen.filetype == "Image":
            return u'<img src="%s" />' % obj.imagen.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Imágen"

class EnlacesAdmin(admin.ModelAdmin):
    model = Enlaces
    list_display = ("titulo", "posicion", "active")
    fields = ("titulo", 'enlace', "posicion", "active")

##Page3

class ServiAdmin(admin.ModelAdmin):
    model = Servicio
    list_display = ('nombre',"miniatura", "posicion","active")
    exclude = ('seo_titulo','seo_descript')
    # list_editable = ('seo_titulo','seo_descript')
    # fields = ()
    list_per_page = 21
    def miniatura(self, obj):
        if obj.imagen1 and obj.imagen1.filetype == "Image":
            return u'<img src="%s" />' % obj.imagen1.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Imágen"


    class Media:
        js = js_tiny




##Page 4

class PromoAdmin(admin.ModelAdmin):
    model = Promo
    list_display = ('nombre',"miniatura", "posicion","active")
    list_per_page = 8

    def miniatura(self, obj):
        if obj.imagen1 and obj.imagen1.filetype == "Image":
            return u'<img src="%s" />' % obj.imagen1.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Imágen"


class SliGaleriaAdmin(admin.ModelAdmin):
    #model = SliGaleria
    list_display = ("miniatura", "posicion", "active")

    def miniatura(self, obj):
        if obj.imagen and obj.imagen.filetype == "Image":
            return u'<img src="%s" />' % obj.imagen.version_generate(
                ADMIN_THUMBNAIL).url
        else:
            return ""


    miniatura.allow_tags = True
    miniatura.short_description = "Imágen"


admin.site.register(Contacto, ContactoAdmin)
admin.site.register(ContactoHome, ContactoHomeAdmin)
admin.site.register(SuscripcionPromo, SuscripcionPromoAdmin)
admin.site.register(InfoSite, InfoSiteAdmin)
admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Noticia, NoticiaAdmin)
admin.site.register(Slyder, SlyderAdmin)
admin.site.register(SliGaleria, SliGaleriaAdmin)
admin.site.register(Enlaces, EnlacesAdmin)
admin.site.register(Bloque, BloqueAdmin)
admin.site.register(Nosotros, NosotrosAdmin)
admin.site.register(Servicio, ServiAdmin)
admin.site.register(Promo, PromoAdmin)
admin.site.unregister(Group)
admin.site.unregister(Site)
