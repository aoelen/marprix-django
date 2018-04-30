from django.urls import path
from . import views

app_name = 'marketplace'

urlpatterns = [
    path('', views.index, name='index'),
    path('market-leader', views.housekeeping, name='housekeeping'),
    path('save', views.save, name='save')
]
