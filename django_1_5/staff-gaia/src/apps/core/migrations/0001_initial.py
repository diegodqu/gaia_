# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'ShortURL'
        db.create_table(u'core_shorturl', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('url', self.gf('django.db.models.fields.CharField')(max_length=250)),
            ('uuid', self.gf('django.db.models.fields.CharField')(default='', max_length=5)),
            ('fecha', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('visitas', self.gf('django.db.models.fields.IntegerField')(default=0)),
        ))
        db.send_create_signal(u'core', ['ShortURL'])


    def backwards(self, orm):
        # Deleting model 'ShortURL'
        db.delete_table(u'core_shorturl')


    models = {
        u'core.shorturl': {
            'Meta': {'object_name': 'ShortURL'},
            'fecha': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'url': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'uuid': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '5'}),
            'visitas': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        }
    }

    complete_apps = ['core']