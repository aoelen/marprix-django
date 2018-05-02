$(document).ready(function() {
    $('.addProduct').on('click',function(e) {
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
    });

    bind();
});

function bind() {
    $('.deleteProduct').unbind('click');

    $('.deleteProduct').on('click',function() {
        if (confirm('Do you want to delete this product?')) {
            $(this).parents('tr').remove();
        }
    });
}
