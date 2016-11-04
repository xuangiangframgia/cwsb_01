$(document).on('click', '.delete_space', function(){
  $(this).closest('.col-sm-12').fadeOut();
});
$(document).ready(function(){
  $('.check-booking').on('click', function(){
    id = $(this).attr('id');
    if ($(this).prop('checked')){
      $('.' + id).prop('disabled', false);
    } else {
      $('.' + id).prop('disabled', true);
      $('.' + id).val('');
    }
  });
});
