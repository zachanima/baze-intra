$(function() {
  $('[name=remark]').click(function() {
    $(':checkbox').attr('checked', false);
    $('#order_' + $(this).attr('data-order_id')).attr('checked', true);
  });

  $('[data-confirm]').click(function() {
    return confirm($(this).attr('data-confirm'));
  });

  $('[data-prompt]').click(function() {
    value = prompt($(this).attr('data-prompt'), $(this).attr('data-default') || '');
    if (value) {
      $('[name=submit]').attr('value', value);
    } else {
      return false;
    }
  });

  $('tbody :checkbox').change(function() {
    $('#actions button').attr('disabled', $('tbody :checked').length == 0);
  });
});
