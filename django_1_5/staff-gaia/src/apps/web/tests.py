'''
    web test's
'''

from django.conf import settings
from django.test import TestCase
from models import Noticia


class WebViewsTest(TestCase):
    fixtures = ['initial_data_.json']

    def setUp(self):
        Noticia.objects.create(nombre='Mi Noticia', detalle='detalle..')

    def test_urls(self):
        # home
        resp = self.client.get('/')
        self.assertEqual(resp.status_code, 200)

        # contacto
        resp = self.client.get('/contacto/')
        self.assertEqual(resp.status_code, 200)

        resp = self.client.post('/contacto/')
        self.assertEqual(resp.status_code, 200)

        resp = self.client.post('/contacto/', {'nombres': 'Jhon',
            'apellidos': 'Doe', 'email': 'a@a.com', 'asunto': 'Asunto..'})
        self.assertEqual(resp.status_code, 200)

        # noticias
        resp = self.client.get('/noticias/')
        self.assertEqual(resp.status_code, 200)

        resp = self.client.get('/noticias/?n=2')
        self.assertEqual(resp.status_code, 200)

        resp = self.client.get('/noticias/mi-noticia/')
        self.assertEqual(resp.status_code, 200)

        # miniaturas
        resp = self.client.get('/test/')
        self.assertEqual(resp.status_code, 200)

        # humans.txt
        resp = self.client.get('/humans.txt')
        self.assertEqual(resp.status_code, 200)

        # robots.txt
        resp = self.client.get('/robots.txt')
        self.assertEqual(resp.status_code, 200)

        # sitemap.xml
        resp = self.client.get('/sitemap.xml')
        self.assertEqual(resp.status_code, 200)

        # 404
        resp = self.client.get('/noexiste/')
        self.assertEqual(resp.status_code, 404)

        # admin
        resp = self.client.get('/{0}/'.format(settings.ADMIN_URL))
        self.assertEqual(resp.status_code, 200)
