# -*- coding: utf-8 -*-

import csv
from unidecode import unidecode

from django.http import HttpResponse


def export_as_csv_action(description="Exporta la lista en un archivo csv",
                         fields=None, exclude=None, header=True):
    """
        This function returns an export csv action
        'fields' and 'exclude' work like in django ModelForm
        'header' is whether or not to output the column names as the first row
    """
    def export_as_csv(modeladmin, request, queryset):
        """
            Generic csv export admin action.
            based on http://djangosnippets.org/snippets/2369/
        """
        opts = modeladmin.model._meta
        field_names = set([field.name for field in opts.fields])
        if fields:
            fieldset = set(fields)
            field_names = field_names & fieldset
        elif exclude:
            excludeset = set(exclude)
            field_names = field_names - excludeset

        response = HttpResponse(mimetype='text/csv')
        response['Content-Disposition'] = 'attachment; filename=%s.csv' % unicode(opts).replace('.', '_')

        writer = csv.writer(response)
        if header:
            writer.writerow(list(field_names))
        for obj in queryset:
            writer.writerow([unidecode(unicode(getattr(obj, field))) for field in field_names])
        return response
    export_as_csv.short_description = description
    return export_as_csv
