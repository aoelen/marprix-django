from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect

from .models import Product, Category, Unit, History
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

    all_categories = Category.objects.all().order_by('sort')
    all_products = Product.objects.all().order_by('name')
    all_units = Unit.objects.all().order_by('name')

    success = request.GET.get('success', False)

    context = {
        'all_categories': all_categories,
        'all_products' : all_products,
        'all_units': all_units,
        'success': success
    }

    return render(request, 'marketplace/housekeeping.html', context)

def save(request):
    names = request.POST.getlist('name[]')
    prices = request.POST.getlist('price[]')
    units = request.POST.getlist('unit[]')
    categories = request.POST.getlist('category[]')

    Product.objects.all().delete()

    for index, name in enumerate(names):
        new_product = Product(name=name,category_id=categories[index],unit_id=units[index],price=prices[index])
        new_product.save()

    return HttpResponseRedirect('/market-leader?success=True')

def save_history(request, product_id):
    callerid = request.session.get('callerid', 0)
    new_history = History(callerid=callerid,last_product_id=product_id)
    new_history.save()

# Voice application

def voice_welcome(request):
    callerid = request.GET.get('callerid', 'Unknown')
    caller_has_history = History.objects.all().filter(callerid=callerid)

    # Is the caller an returning client?
    if (caller_has_history.count() == 0):
        returning_client = False
    else:
        returning_client = True

    request.session['callerid'] = callerid

    context = {
        'returning_client': returning_client
    }

    return render(request, 'marketplace/voice_xml/welcome.xml', context, content_type="application/xhtml+xml")

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

def products(request, category_id):
    selected_products = Product.objects.all().filter(category_id=category_id).order_by('name');
    '''callerid = request.session.get('callerid', 0)
    new_history = History(callerid=callerid,last_product_id=163)
    new_history.save()
    '''
    context = {
        'selected_products': selected_products,
        'category_id': category_id
    }

    return render(request, 'marketplace/voice_xml/products.xml', context, content_type="application/xhtml+xml")

def select_product(request, product_id):
    product = Product.objects.get(id=product_id);

    save_history(request, product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/select_product.xml', context, content_type="application/xhtml+xml")

def select_id(request, product_id):
    product = Product.objects.get(id=product_id);

    save_history(request, product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/select_id.xml', context, content_type="application/xhtml+xml")


def history(request):
    callerid = request.session.get('callerid', 0)
    history = History.objects.all().filter(callerid=callerid).order_by('-id')
    history_product_id = history[0].last_product_id
    product = Product.objects.get(id=history_product_id)

    context = {
        'product': product
    }

    return render(request, 'marketplace/voice_xml/history.xml', context, content_type="application/xhtml+xml")



'''
def test_history(request):
    new_history = History(callerid='00',last_product_id=163)
    new_history.save()

    context = {
        'returning_client': False
    }

    return render(request, 'marketplace/voice_xml/welcome.xml', context, content_type="application/xhtml+xml")
'''
