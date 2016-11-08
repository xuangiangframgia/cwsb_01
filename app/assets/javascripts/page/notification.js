$(document).ready(function(){
  $(function(){
    $(window).on('load', function(){
      $('#open-notification').on('click', function(){
        $.ajax({
          type: 'PUT',
          url: '/notifications',
          dataType: 'json',
          success: function(data){
            $('#notification_count').fadeOut('slow');
          },
          error: function(data){
            alert("update fail");
          }
        })
      });
    });
  });
});
