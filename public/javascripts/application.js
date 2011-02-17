$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('[name=remark]').click(function() {
    $(':checkbox').attr('checked', false);
    $('#order_' + $(this).attr('data-order_id')).attr('checked', true);
  });

  $('[data-prompt]').click(function() {
    value = prompt($(this).attr('data-prompt'), $(this).attr('data-default') || '');
    if (value) {
      $(this).attr('value', value);
    } else {
      return false;
    }
  });

  $('tbody :checkbox').change(function() {
    $('#actions input[value]').attr('disabled', $('tbody :checked').length == 0);
  });
});
