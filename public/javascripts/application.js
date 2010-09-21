$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('[name=remark]').click(function() {
    $(':checkbox').attr('checked', false);
    $('#order_' + $(this).parents('tr').attr('data-order_id')).attr('checked', true);
  });

  $('[data-prompt]').click(function() {
    $(this).attr('value', prompt($(this).attr('data-prompt'), $(this).attr('data-default')));
  });

  $('tbody :checkbox').change(function() {
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

