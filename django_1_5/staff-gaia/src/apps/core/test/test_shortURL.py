'''
    Core test's
'''

from random import randint

from django.test import TestCase

from ..models import ShortURL


class ShortURLTest(TestCase):

    def test_view(self):
        url_normal = '/'
        s = ShortURL(url=url_normal)
        s.save()
        response = self.client.get(s.get_absolute_url())
        self.assertRedirects(response, url_normal)

    def test_counter(self):
        url_normal = '/'
        s = ShortURL(url=url_normal)
        s.save()
        r = randint(0, 25)
        for i in xrange(r):
            self.client.get(s.get_absolute_url())

        s_ = ShortURL.objects.get(uuid=s.uuid)
        self.assertEqual(s_.visitas, r)
