$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('[name=remark]').click(function() {
    $(':checkbox').attr('checked', false);
    $('#order_' + $(this).attr('data-order_id')).attr('checked', true);
  });

  $('[data-prompt]').click(function() {
    $(this).attr('value', prompt($(this).attr('data-prompt'), $(this).attr('data-default')));
  });

  $('tbody :checkbox').change(function() {
    $('#actions input[value]').attr('disabled', $('tbody :checked').length == 0);
  });
});
