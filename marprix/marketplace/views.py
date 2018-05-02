from django.shortcuts import render
from django.http import HttpResponse

from .models import Product, Category, Unit
# Create your views here.

def index(request):
    #return HttpResponse('HELLO TO MARKET LEADER')
    all_categories = Category.objects.all().order_by('sort');
    all_products = Product.objects.select_related('unit').all().order_by('name');

    context = {
        'all_categories': all_categories,
        'all_products' : all_products
    }

    return render(request, 'marketplace/index.html', context)

def housekeeping(request):

    all_categories = Category.objects.all().order_by('sort');
    all_products = Product.objects.all().order_by('name');
    all_units = Unit.objects.all().order_by('name');

    context = {
        'all_categories': all_categories,
        'all_products' : all_products,
        'all_units': all_units
    }

    return render(request, 'marketplace/housekeeping.html', context)

def save(request):
    a=1+1

# Voice application

def voice_welcome(request):
    return render(request, 'marketplace/voice_xml/welcome.xml', content_type="application/xhtml+xml")

def voice_categories(request):
    all_categories = Category.objects.all().order_by('sort');

    context = {
        'all_categories': all_categories,
    }

    return render(request, 'marketplace/voice_xml/categories.xml', context, content_type="application/xhtml+xml")

def ids(request):
    all_products = Product.objects.all().order_by('id');

    context = {
        'all_products': all_products,
    }

    return render(request, 'marketplace/voice_xml/ids.xml', context, content_type="application/xhtml+xml")

def products(request):
    category_id = request.GET['category_id']
    selected_products = Product.objects.all().filter(category_id=category_id).order_by('name');

    context = {
        'selected_products': selected_products
    }

    return render(request, 'marketplace/voice_xml/products.xml', context, content_type="application/xhtml+xml")
