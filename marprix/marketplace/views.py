from django.shortcuts import render
from django.http import HttpResponse

from .models import Product, Category
# Create your views here.

def index(request):
    #return HttpResponse('HELLO TO MARKET LEADER')
    all_categories = Category.objects.all().order_by('sort');
    all_products = Product.objects.all().order_by('name');

    context = {
        'all_categories': all_categories,
        'all_products' : all_products
    }

    return render(request, 'marketplace/index.html', context)

def housekeeping(request):

    all_categories = Category.objects.all().order_by('sort');
    all_products = Product.objects.all().order_by('name');

    context = {
        'all_categories': all_categories,
        'all_products' : all_products
    }

    return render(request, 'marketplace/housekeeping.html', context)

def save(request):
    a=1+1
