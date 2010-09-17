$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });

  $('input[name=ordered_by]').click(function() {
    $(this).attr('value', prompt('Hvem er du?'));
  });

  $('table :checkbox').change(function() {
    $('div#actions input[value]').attr('disabled', $('tbody :checked').length == 0);
  });
});
