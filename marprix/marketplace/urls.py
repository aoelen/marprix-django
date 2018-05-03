from django.urls import path
from . import views

app_name = 'marketplace'

urlpatterns = [
    path('', views.index, name='index'),
    path('market-leader', views.housekeeping, name='housekeeping'),
    path('save', views.save, name='save'),
    path('VXML/welcome', views.voice_welcome, name='voice_welcome'),
    path('VXML/categories', views.voice_categories, name='voice_categories'),
    path('VXML/IDs', views.ids, name='ids'),
    path('VXML/products/<int:category_id>', views.products, name='products'),
    path('VXML/select_product/<int:product_id>', views.select_product, name='select_product'),
    path('VXML/select_id/<int:product_id>', views.select_id, name='select_id'),
    path('VXML/history', views.history, name='history')
]
