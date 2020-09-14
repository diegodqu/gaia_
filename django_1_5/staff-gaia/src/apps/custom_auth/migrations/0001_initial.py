# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Usuario'
        db.create_table(u'custom_auth_usuario', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('is_active', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('last_login', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75, blank=True)),
            ('password', self.gf('django.db.models.fields.CharField')(default='', max_length=96, blank=True)),
            ('set_password', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('uuid_hash', self.gf('django.db.models.fields.CharField')(default='', max_length=36, blank=True)),
        ))
        db.send_create_signal(u'custom_auth', ['Usuario'])


    def backwards(self, orm):
        # Deleting model 'Usuario'
        db.delete_table(u'custom_auth_usuario')


    models = {
        u'custom_auth.usuario': {
            'Meta': {'object_name': 'Usuario'},
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '96', 'blank': 'True'}),
            'set_password': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'uuid_hash': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '36', 'blank': 'True'})
        }
    }

    complete_apps = ['custom_auth']