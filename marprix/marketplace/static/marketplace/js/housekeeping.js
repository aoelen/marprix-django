$(document).ready(function() {
    $('.addProduct').on('click',function(e) {
        e.preventDefault();
    });

    $('#productModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var categoryId = button.data('category-id');
        var modal = $(this);

        resetDialog();

        if (typeof categoryId !== 'undefined' && categoryId != 'undefined') { //new product
            modal.find('#category_id').val(categoryId);
        } else { //edit product
            var row = button.parents('tr');

            var form = $('#productForm');
            form.attr('data-edit-id', row.find('input[type="hidden"][data-type="id"]').val());
            form.find('#name').val(row.find('input[type="hidden"][data-type="name"]').val());
            form.find('#category_id').val(row.find('input[type="hidden"][data-type="category_id"]').val());
            form.find('#price').val(row.find('input[type="hidden"][data-type="price"]').val());
            form.find('#unit_id').val(row.find('input[type="hidden"][data-type="unit_id"]').val());
            form.find('#seller_name').val(row.find('input[type="hidden"][data-type="seller_name"]').val());
            form.find('#seller_location').val(row.find('input[type="hidden"][data-type="seller_location"]').val());
        }
    });

    $('#productForm').on('submit', function() {
        var form = $('#productForm'),
            name = form.find('#name').val(),
            category_id = form.find('#category_id').val(),
            price = form.find('#price').val(),
            unit_id = form.find('#unit_id').val(),
            seller_name = form.find('#seller_name').val(),
            seller_location = form.find('#seller_location').val(),
            product_id = form.attr('data-edit-id');

        var data = { //in order to ensure browsers compatibility for ES6<, no shorthand notation is used
            name: name,
            category_id: category_id,
            price: price,
            unit_id: unit_id,
            seller_name: seller_name,
            seller_location: seller_location,
            csrfmiddlewaretoken: window.CSRF_TOKEN
        };

        if (typeof product_id !== 'undefined' && product_id != 'undefined') { //new product
            data.product_id = product_id;
        }

        console.log(data);

        $.ajax({
            url: "/save",
            method: "POST",
            data: data,
        }).done(function(msg) {
            console.log(msg);

            window.location = '/market-leader?success=True';
        });

        //$('#productModal').modal('hide');
    });

    $('.deleteProduct').on('click',function() {
        if (confirm('Do you want to delete this product?')) {
            var product = $(this).parents('tr');
            var productId = product.attr('data-product-id');

            $.ajax({
                url: "/delete/" + productId,
                method: "DELETE",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("X-CSRFToken", window.CSRF_TOKEN);
                }
            }).done(function(msg) {
                product.remove();
            });
        }
    });
    /*$('.addProduct').on('click',function(e) {
        e.preventDefault();

        var category_id = $(this).attr('data-category-id');
        var product = prompt('Please type the name of the product you want to add');

        if (product == null) {
            return;
        }

        var rowTemplate = $('#templates .product').clone();
        rowTemplate.find('[data-placeholder="name"]').text(product);
        rowTemplate.find('[data-name]').val(product);
        rowTemplate.find('[data-category]').val(category_id);

        $(this).parents('table').find('tbody').append(rowTemplate);
        console.log(rowTemplate);
        console.log('add');
        bind();
        //$(rowTemplate).insertAfter(.find('tr:last'));
    });*/

    //bind();
});

function resetDialog() {
    var form = $('#productForm');
    form.removeAttr('data-edit-id');
    form.find('#name').val('');
    form.find('#category_id').val('');
    form.find('#price').val('');
    form.find('#unit_id').val('');
    form.find('#seller_name').val('');
    form.find('#seller_location').val('');
}
/*function bind() {
    $('.deleteProduct').unbind('click');

    $('.deleteProduct').on('click',function() {
        if (confirm('Do you want to delete this product?')) {
            $(this).parents('tr').remove();
        }
    });
}*/
