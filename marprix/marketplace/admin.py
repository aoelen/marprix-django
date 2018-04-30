from django.contrib import admin

from .models import Product, Category

# Make the models accessible via the Django admin panel
admin.site.register(Product)
admin.site.register(Category)
