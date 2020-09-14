# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Servicio.slug'
        db.add_column(u'web_servicio', 'slug',
                      self.gf('django.db.models.fields.SlugField')(default='', max_length=180, blank=True),
                      keep_default=False)

        # Adding field 'Servicio.logo'
        db.add_column(u'web_servicio', 'logo',
                      self.gf('filebrowser.fields.FileBrowseField')(default='', max_length=200, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Servicio.slug'
        db.delete_column(u'web_servicio', 'slug')

        # Deleting field 'Servicio.logo'
        db.delete_column(u'web_servicio', 'logo')


    models = {
        u'web.bloque': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Bloque'},
            'descripcion': ('django.db.models.fields.TextField', [], {'max_length': '120'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen1': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'imagen2': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'nombre1': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'nombre2': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'titulo': ('django.db.models.fields.CharField', [], {'max_length': '40'})
        },
        u'web.categoria': {
            'Meta': {'object_name': 'Categoria'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            u'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            u'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'parent': ('mptt.fields.TreeForeignKey', [], {'blank': 'True', 'related_name': "'children'", 'null': 'True', 'to': u"orm['web.Categoria']"}),
            u'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '180', 'blank': 'True'}),
            u'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        u'web.contacto': {
            'Meta': {'ordering': "['-fecha']", 'object_name': 'Contacto'},
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'fecha': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mensaje': ('django.db.models.fields.TextField', [], {}),
            'nombres': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '120'})
        },
        u'web.contactohome': {
            'Meta': {'ordering': "['-fecha']", 'object_name': 'ContactoHome'},
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'fecha': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombres': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '120'})
        },
        u'web.enlaces': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Enlaces'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'enlace': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'titulo': ('django.db.models.fields.CharField', [], {'max_length': '38', 'blank': 'True'})
        },
        u'web.infosite': {
            'Meta': {'object_name': 'InfoSite'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'coordenadas': ('django.db.models.fields.CharField', [], {'max_length': '48'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'direccion': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'email_form': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'facebook': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'fijo': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'ga': ('django.db.models.fields.CharField', [], {'max_length': '24', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'site': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'titulo': ('django.db.models.fields.CharField', [], {'max_length': '40', 'blank': 'True'}),
            'twitter': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'})
        },
        u'web.nosotros': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Nosotros'},
            'descripcion': ('django.db.models.fields.TextField', [], {'max_length': '500'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '180', 'blank': 'True'})
        },
        u'web.noticia': {
            'Meta': {'ordering': "['-fecha']", 'object_name': 'Noticia'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'detalle': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fecha': ('django.db.models.fields.DateField', [], {'default': 'datetime.datetime(2014, 11, 12, 0, 0)'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'portada': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '180', 'blank': 'True'})
        },
        u'web.producto': {
            'Meta': {'ordering': "['nombre']", 'object_name': 'Producto'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'categoria': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'productos'", 'to': u"orm['web.Categoria']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '180', 'blank': 'True'})
        },
        u'web.promo': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Promo'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen1': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'imagen2': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'})
        },
        u'web.servicio': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Servicio'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'descripcion': ('django.db.models.fields.TextField', [], {'max_length': '120'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen1': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'imagen2': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'logo': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200', 'blank': 'True'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'nombre1': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '180', 'blank': 'True'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '120', 'blank': 'True'})
        },
        u'web.sligaleria': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'SliGaleria'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'})
        },
        u'web.slyder': {
            'Meta': {'ordering': "['posicion']", 'object_name': 'Slyder'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'created_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'imagen': ('filebrowser.fields.FileBrowseField', [], {'max_length': '200'}),
            'lugar': ('django.db.models.fields.CharField', [], {'max_length': '1'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'})
        },
        u'web.suscripcionpromo': {
            'Meta': {'ordering': "['-fecha']", 'object_name': 'SuscripcionPromo'},
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75'}),
            'fecha': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['web']