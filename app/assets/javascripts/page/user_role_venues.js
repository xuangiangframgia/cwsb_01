$(document).on('click', '.change-role', function(e){
  e.preventDefault();
  $('#type_role').val($(this).data('value'));
  role = $(this).attr('id');
  $('p.user_role').children().removeClass('fa-check').addClass('fa-times');
  $('p.user_role').children().addClass('text-muted');
  $('p.' + role).children().addClass('fa-check').removeClass('fa-times');
  $('p.' + role).children().removeClass('text-muted');
});

$(document).on('keyup click', 'input#search', function() {
  key_search = $(this).val();
  if (key_search.length > 0) {
    $.get($('#search_user').attr('action'), $('#search_user').serialize(),
      null, 'script');
    return false;
  } else {
    $('.list-group').slideUp();
  }
});

$(document).on('click', '.click-name-user', function(){
  $('.list-group').slideUp();
  $('input#search').val($(this).html());
  $('input.user_id').val($(this).data('id'));
});
