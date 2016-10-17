$(function(){
  $(window).load(function(){
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    var markers = [];
    latitude = 0;
    longitude = 0;

    searchBox.addListener('places_changed', function(e) {
      form = $('#search-space-form');
      form.submit();
    });

    handler = Gmaps.build('Google');
    handler.buildMap({
        provider: {
          disableDefaultUI: true
          // pass in other Google Maps API options here
        },
        internal: {
          id: 'map'
        }
      },
      function(){
        getUserLocationByService();
      }
    );

    var serviceUrl = "http://freegeoip.net/json/";
    function getUserLocationByService(){
      $.ajax({
        url: serviceUrl
      }).then(function(data) {
        latitude = data.latitude;
        longitude = data.longitude;
        centre_pos = {'lat': latitude, 'lng': longitude}
        handler.map.centerOn(centre_pos);
        handler.getMap().setZoom(16);
      });
    }
  });
});
