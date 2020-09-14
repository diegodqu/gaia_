# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'InfoSite'
        db.create_table(u'web_infosite', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75, blank=True)),
            ('email_form', self.gf('django.db.models.fields.EmailField')(max_length=75, blank=True)),
            ('fijo', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('direccion', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('site', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('facebook', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('twitter', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('titulo', self.gf('django.db.models.fields.CharField')(max_length=40, blank=True)),
            ('description', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('ga', self.gf('django.db.models.fields.CharField')(max_length=24, blank=True)),
            ('coordenadas', self.gf('django.db.models.fields.CharField')(max_length=48)),
        ))
        db.send_create_signal(u'web', ['InfoSite'])

        # Adding model 'Noticia'
        db.create_table(u'web_noticia', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=180, blank=True)),
            ('fecha', self.gf('django.db.models.fields.DateField')(default=datetime.datetime(2014, 3, 7, 0, 0))),
            ('detalle', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('portada', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
        ))
        db.send_create_signal(u'web', ['Noticia'])

        # Adding model 'Categoria'
        db.create_table(u'web_categoria', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=180, blank=True)),
            ('parent', self.gf('mptt.fields.TreeForeignKey')(blank=True, related_name='children', null=True, to=orm['web.Categoria'])),
            (u'lft', self.gf('django.db.models.fields.PositiveIntegerField')(db_index=True)),
            (u'rght', self.gf('django.db.models.fields.PositiveIntegerField')(db_index=True)),
            (u'tree_id', self.gf('django.db.models.fields.PositiveIntegerField')(db_index=True)),
            (u'level', self.gf('django.db.models.fields.PositiveIntegerField')(db_index=True)),
        ))
        db.send_create_signal(u'web', ['Categoria'])

        # Adding model 'Producto'
        db.create_table(u'web_producto', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=180, blank=True)),
            ('categoria', self.gf('django.db.models.fields.related.ForeignKey')(related_name='productos', to=orm['web.Categoria'])),
            ('imagen', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
        ))
        db.send_create_signal(u'web', ['Producto'])

        # Adding model 'Contacto'
        db.create_table(u'web_contacto', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('fecha', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('nombres', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75)),
            ('mensaje', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal(u'web', ['Contacto'])

        # Adding model 'SuscripcionPromo'
        db.create_table(u'web_suscripcionpromo', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('fecha', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75)),
        ))
        db.send_create_signal(u'web', ['SuscripcionPromo'])

        # Adding model 'ContactoHome'
        db.create_table(u'web_contactohome', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('fecha', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('nombres', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75)),
        ))
        db.send_create_signal(u'web', ['ContactoHome'])

        # Adding model 'Slyder'
        db.create_table(u'web_slyder', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('imagen', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('lugar', self.gf('django.db.models.fields.CharField')(max_length=1)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Slyder'])

        # Adding model 'Enlaces'
        db.create_table(u'web_enlaces', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('titulo', self.gf('django.db.models.fields.CharField')(max_length=40, blank=True)),
            ('enlace', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Enlaces'])

        # Adding model 'Bloque'
        db.create_table(u'web_bloque', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre1', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('nombre2', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('titulo', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('descripcion', self.gf('django.db.models.fields.TextField')(max_length=120)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('imagen1', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('imagen2', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Bloque'])

        # Adding model 'Nosotros'
        db.create_table(u'web_nosotros', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=180, blank=True)),
            ('descripcion', self.gf('django.db.models.fields.TextField')(max_length=500)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Nosotros'])

        # Adding model 'Servicio'
        db.create_table(u'web_servicio', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('nombre1', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('descripcion', self.gf('django.db.models.fields.TextField')(max_length=120)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('imagen1', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('imagen2', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Servicio'])

        # Adding model 'Promo'
        db.create_table(u'web_promo', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('imagen1', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('imagen2', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['Promo'])

        # Adding model 'SliGaleria'
        db.create_table(u'web_sligaleria', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('created_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('modified_by', self.gf('django.db.models.fields.IntegerField')(default=0, null=True)),
            ('imagen', self.gf('filebrowser.fields.FileBrowseField')(max_length=200)),
            ('posicion', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal(u'web', ['SliGaleria'])


    def backwards(self, orm):
        # Deleting model 'InfoSite'
        db.delete_table(u'web_infosite')

        # Deleting model 'Noticia'
        db.delete_table(u'web_noticia')

        # Deleting model 'Categoria'
        db.delete_table(u'web_categoria')

        # Deleting model 'Producto'
        db.delete_table(u'web_producto')

        # Deleting model 'Contacto'
        db.delete_table(u'web_contacto')

        # Deleting model 'SuscripcionPromo'
        db.delete_table(u'web_suscripcionpromo')

        # Deleting model 'ContactoHome'
        db.delete_table(u'web_contactohome')

        # Deleting model 'Slyder'
        db.delete_table(u'web_slyder')

        # Deleting model 'Enlaces'
        db.delete_table(u'web_enlaces')

        # Deleting model 'Bloque'
        db.delete_table(u'web_bloque')

        # Deleting model 'Nosotros'
        db.delete_table(u'web_nosotros')

        # Deleting model 'Servicio'
        db.delete_table(u'web_servicio')

        # Deleting model 'Promo'
        db.delete_table(u'web_promo')

        # Deleting model 'SliGaleria'
        db.delete_table(u'web_sligaleria')


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
            'titulo': ('django.db.models.fields.CharField', [], {'max_length': '40', 'blank': 'True'})
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
            'fecha': ('django.db.models.fields.DateField', [], {'default': 'datetime.datetime(2014, 3, 7, 0, 0)'}),
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
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'modified_by': ('django.db.models.fields.IntegerField', [], {'default': '0', 'null': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'nombre1': ('django.db.models.fields.CharField', [], {'max_length': '120'}),
            'posicion': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '120'})
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