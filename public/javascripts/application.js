$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('input[name=ordered_by]').click(function() {
    $(this).attr('value', prompt('Hvem er du?'));
  });

  $('table :checkbox').change(function() {
    $('#actions input[value]').attr('disabled', $('tbody :checked').length == 0);
  });

  if ($('#data').length > 0) {
    setInterval(updateOrders, 10000);
  }

});

function updateOrders() {
  var supplier_id = $('#data').attr('data-id');
  var after = $('tbody tr:nth-child(2)').attr('data-time');
  $.getScript('/suppliers/' + supplier_id + '/orders.js?after=' + after);
}

