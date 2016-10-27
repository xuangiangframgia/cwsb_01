$(document).ready(function(){
  var times = $('.times').val();
  var total_prices = [];
  var booking_ids = [];
  display_total_price_and_pass_value(times, total_prices, booking_ids);
  hide_flash();
  send_request(total_prices, booking_ids);
});

function display_total_price_and_pass_value(times, total_prices, booking_ids){
  for(var i = 0; i< times; i++){
    total_prices[i+1] = 0;
    booking_ids[i+1] = "";
    var venue_id = $('.venue_id-' + i).val();
    var display_total_price = $('#total-price-' + venue_id);
    var times_child = $('.times-child-' + venue_id).val();
    var hidden_form_total_price = $('#total-price-form');
    var hidden_form_booking_ids = $('#booking_ids');
    for(var j=0; j< times_child; j++){
      var booking_id = $('.' + i + '-' + j).val();
      booking_ids[i+1] += (booking_id + " ");
      var quantity = $('#quantity-' + booking_id);
      var price = $('#price-' + booking_id).text().split('$')[1];
      var total = parseFloat(quantity.text() * price);
      total_prices[i+1] += total;
    }
    display_total_price.html('$ ' + total_prices[i+1]);
    hidden_form_total_price.val(total_prices[i+1]);
    hidden_form_booking_ids.val(booking_ids[i+1]);
  }
}

function hide_flash(){
  var button_close = $('.close');
  button_close.click(function(){
    $('.form-alert').slideUp('slow');
  });
}

function send_request(total_prices, booking_ids){
  var list_button_request = $('.button-request');
  list_button_request.click(function(){
    var this_venue_id = this.id;
    create_order(this_venue_id, total_prices[this_venue_id], booking_ids[this_venue_id]);
  });
}

function create_order(venue_id, total_price, booking_ids){
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: '/venues/' + venue_id + '/orders',
    data: {total_paid: total_price, venue_id: venue_id, booking_ids: booking_ids},
    success: function(data){
      if(data.message == "success"){
        $('#form-border-' + venue_id).slideToggle('slow');
        $('#form-alert-success').slideToggle('slow');
        $('html, body').animate({scrollTop: '0px'}, 'slow');
      }else{
        $('#form-alert-fail').slideToggle('slow');
      }
    },
    error: function(XMLHttpRequest, textStatus, errorThrown){
      alert('some error' + textStatus + ' | ' + errorThrown);
    }
  });
}

