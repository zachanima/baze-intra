$(function() {
  $('thead :checkbox').change(function() {
    $('tbody :checkbox').attr('checked', $(this).attr('checked'));
  });
});
