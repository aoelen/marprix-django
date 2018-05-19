from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
# Import the needed models
from .models import Product, Category, Unit, History
from django.core import serializers



def index(request):
    '''
    Function for the front-end to request product prices
    '''

    all_categories = Category.objects.all().order_by('sort'); # Get all categories, order by a predefined order in the database
    all_products = Product.objects.select_related('unit').all().order_by('name'); # Get all products, and related units, ordered by name

    # Pass parameters to the template
    context = {
        'all_categories': all_categories,
        'all_products' : all_products
    }

    # Render the .html file
    return render(request, 'marketplace/index.html', context)

def housekeeping(request):
    '''
    Shows the housekeeping page where the market leader can enter the prices
    '''
    # Get all needed data
    all_categories = Category.objects.all().order_by('sort')
    all_products = Product.objects.all().order_by('name')
    all_units = Unit.objects.all().order_by('name')

    # Get the query string to show a flash message after saving
    success = request.GET.get('success', False)

    context = {
        'all_categories': all_categories,
        'all_products' : all_products,
        'all_units': all_units,
        'success': success,
        'productsJson': serializers.serialize('json', all_products)
    }

    return render(request, 'marketplace/housekeeping.html', context)
'''
def save(request):

    # Get all the POST parameters, which are arrays
    names = request.POST.getlist('name[]')
    prices = request.POST.getlist('price[]')
    units = request.POST.getlist('unit[]')
    categories = request.POST.getlist('category[]')

    # Delete all products
    Product.objects.all().delete()

    # Enter all products again in the database
    for index, name in enumerate(names):
        new_product = Product(name=name,category_id=categories[index],unit_id=units[index],price=prices[index])
        new_product.save()

    # Redirect, show success message
    return HttpResponseRedirect('/market-leader?success=True')
'''

def save(request):
    '''
    Save the data posted in the houseeking file
    '''
    # Get all the POST parameters, which are arrays
    name = request.POST.get('name')
    category_id = request.POST.get('category_id')
    price = request.POST.get('price')
    unit_id = request.POST.get('unit_id')
    seller_name = request.POST.get('seller_name')
    seller_location = request.POST.get('seller_location')
    product_id = request.POST.get('product_id', False)

    if product_id == False:
        new_product = Product(name=name,category_id=category_id,price=price,unit_id=unit_id,seller_name=seller_name,seller_location=seller_location)
    else:
        new_product = Product(id=product_id,name=name,category_id=category_id,price=price,unit_id=unit_id,seller_name=seller_name,seller_location=seller_location)

    new_product.save()

    '''prices = request.POST.getlist('price[]')
    units = request.POST.getlist('unit[]')
    categories = request.POST.getlist('category[]')'''

    # Delete all products
    #Product.objects.all().delete()

    # Enter all products again in the database
    '''for index, name in enumerate(names):
        new_product = Product(name=name,category_id=categories[index],unit_id=units[index],price=prices[index])
        new_product.save()

    # Redirect, show success message
    return HttpResponseRedirect('/market-leader?success=True')'''

    return HttpResponse('')

def delete(request, product_id):
    Product.objects.filter(id=product_id).delete()

    return HttpResponse('')

def save_history(request, product_id):
    '''
    This functions saves the phone number and product requested (for the history function)
    '''
    # Phone numbers
    callerid = request.session.get('callerid', 0)
    # Save history
    new_history = History(callerid=callerid,last_product_id=product_id)
    new_history.save()

# Voice application

def voice_welcome(request):
    '''
    Welcome the caller function, renders are VoiceXML
    '''
    # Get the phone numbers, if not provided: unknown
    callerid = request.GET.get('callerid', 'Unknown')
    # Get the history of the caller, to find out this it is a returning client
    caller_has_history = History.objects.all().filter(callerid=callerid)

    # Is the caller an returning client?
    if (caller_has_history.count() == 0):
        returning_client = False
    else:
        returning_client = True

    # Place the phone number in a session to later save the history
    request.session['callerid'] = callerid

    context = {
        'returning_client': returning_client
    }

    # Render the voice XML
    return render(request, 'marketplace/voice_xml/welcome.xml', context, content_type="application/xhtml+xml")

def voice_categories(request):
    '''
    Get all the product categories
    '''
    all_categories = Category.objects.all().order_by('sort');

    context = {
        'all_categories': all_categories,
    }

    return render(request, 'marketplace/voice_xml/categories.xml', context, content_type="application/xhtml+xml")

def ids(request):
    '''
    File for entering a product ID directly
    '''
    all_products = Product.objects.all().order_by('id');

    context = {
        'all_products': all_products,
    }

    return render(request, 'marketplace/voice_xml/ids.xml', context, content_type="application/xhtml+xml")

def products(request, category_id):
    '''
    Lists all the products
    '''

    selected_products = Product.objects.all().filter(category_id=category_id).order_by('name');

    context = {
        'selected_products': selected_products,
        'category_id': category_id
    }

    return render(request, 'marketplace/voice_xml/products.xml', context, content_type="application/xhtml+xml")

def select_product(request, product_id):
    '''
    Select a product
    This file is seperated from the products file, to make it possible to save the history
    '''
    product = Product.objects.get(id=product_id);

    save_history(request, product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/select_product.xml', context, content_type="application/xhtml+xml")

def select_id(request, product_id):
    '''
    Product selected based on ID
    '''
    product = Product.objects.get(id=product_id);

    save_history(request, product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/select_id.xml', context, content_type="application/xhtml+xml")


def history(request):
    '''
    Get the latest product ID requested by this caller
    '''
    callerid = request.session.get('callerid', 0)
    history = History.objects.all().filter(callerid=callerid).order_by('-id')
    history_product_id = history[0].last_product_id
    product = Product.objects.get(id=history_product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/history.xml', context, content_type="application/xhtml+xml")
