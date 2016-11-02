$(document).ready(function(){
  $('#different').on('click', function(){
    $('input:checkbox').not(this).prop('checked', this.checked);
    $('.status').not(this).replaceWith("<label class='form-label status label label-primary "+ $(this).attr('id') +"'>open</label>");
  });

  $('input:checkbox').on('click', function(){
    if ($(this).prop('checked')){
      $('.'+$(this).attr('id')).replaceWith("<label class='form-label status label label-primary "+ $(this).attr('id') +"'>open</label>");
    }
    else {
      $('.'+$(this).attr('id')).replaceWith("<label class='form-label status label label-danger "+ $(this).attr('id') +"'>close</label>");
    };
  });
});
