$(document).ready(function(){
  var total_index = $('#total_index').val();
  var total_prices = [];
  for(var i = 0 ; i< total_index; i++){
    var times = $('#times-' + i).val();
    for(var j = 0; j< times; j++){
      var checked_button = $('#checked_button-' + i + '-' + j).val();
      console.log(checked_button);
      $('#' + checked_button).prop('checked', true);
    }
  }
  update_single_state();
  update_all_state();
});

function display_state_after_update(booking_ids){
  $.each(booking_ids, function(i, field){
    $('#accepted-' + field).prop('checked', true);
  });
}

function update_single_state(){
  $('.state').on('click', function(){
    var state = $(this).val();
    var booking = $(this).attr('name');
    $.ajax({
      type: 'PUT',
      url : '/bookings/' + booking,
      dataType: 'json',
       data: {
        state: state
      },
      success: function(data) {
        $.growl.notice({ message: data["flash"] });
      },
      error: function(error_message) {
        $.growl.error({ message: 'error ' + error_message });
      }
    });
  });
};

function update_all_state(){
  var button_check_all = $('.check-all');
  button_check_all.on('click', function(){
    var bunch_of_booking_id = [];
    var venue_id = this.id;
    var booking_ids = $('.booking_ids-' + venue_id).serializeArray();
    $.each(booking_ids, function(i, field){
      bunch_of_booking_id[i] = field.value;
    });
    $.ajax({
      type: 'PUT',
      url : '/store_bookings',
      dataType: 'json',
       data: {
        booking_ids: bunch_of_booking_id,
        state: "accepted"
      },
      success: function(data) {
        $.growl.notice({ message: data["flash"] });
        display_state_after_update(bunch_of_booking_id);
      },
      error: function(error_message) {
        $.growl.error({ message: 'error ' + error_message });
      }
    });
  });
}
