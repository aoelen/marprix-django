from django.urls import path
from . import views

app_name = 'marketplace'

urlpatterns = [
    path('', views.index, name='index'),
    path('market-leader', views.housekeeping, name='housekeeping'),
    path('save', views.save, name='save'),
    path('VXML/welcome', views.voice_welcome, name='voice_welcome'),
    path('VXML/categories', views.voice_categories, name='voice_categories')
]
