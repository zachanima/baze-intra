$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('input[name=ordered_by]').click(function() {
    $(this).attr('value', prompt($(this).attr('data-prompt')));
  });

  $('table :checkbox').change(function() {
    $('#actions input[value]').attr('disabled', $('tbody :checked').length == 0);
  });

  if ($('#orders').length > 0) {
    setTimeout(updateOrders, 60000);
  }

});

function updateOrders() {
  var supplier_id = $('#orders').attr('data-supplier_id');
  var order_id = $('tbody tr:first-child').attr('data-order_id');
  $.getScript('/suppliers/' + supplier_id + '/orders.js?id=' + order_id);
  setTimeout(updateOrders, 60000);
}

