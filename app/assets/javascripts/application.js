// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
$(function(){ $(document).foundation(); });
function drawMap(){
  L.mapbox.accessToken = "pk.eyJ1IjoibGl6dmRrIiwiYSI6IlJodmpRdzQifQ.bUxjjqfXrx41XRFS7cXnIA";

  var map = L.mapbox.map('map', 'mapbox.streets-satellite', { zoomControl: false });
  var geocoder = L.mapbox.geocoder('mapbox.places');
  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);
  var marker = L.marker(new L.LatLng(42.3603, -71.0580), {
    icon: L.mapbox.marker.icon({'marker-color': '4f8b89', 'marker-size' : 'large' }),
    draggable: true
  });
  var $searchBox = $('.leaflet-control-mapbox-geocoder-form').children().first();
  var $eventAddress = $('#pollution_event_address');
  var $eventLat = $('#pollution_event_event_lat');
  var $eventLng = $('#pollution_event_event_lng');
  var $address = $eventAddress.val();
  var $geolocate = $('#geolocate');
  map.fitBounds([
    [42.346397049733966, -71.1029577255249],
    [42.369451896762385, -71.04429244995117]
    ]);

  if (!navigator.geolocation) {
    $geolocate.val('Geolocation is not available');
  } else {
    $geolocate.on('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      map.locate();
    });
  }

  map.on('locationfound', function(e) {
    map.fitBounds(e.bounds, {paddingTopLeft: [250, 0]});
    marker.setLatLng(e.latlng).update();
    ondragend();
  });

  map.on('locationerror', function() {
    alert('Not found, enter your address');
  });

  function ondragend() {
    var m = marker.getLatLng();
    $eventLat.val(marker.getLatLng().lat);
    $eventLng.val(marker.getLatLng().lng);

    geocoder.reverseQuery(m, populateAddress);
  }

  function geocodeAddress () {
    $eventAddress.change(function(e) {
      var address = $eventAddress.val();
      geocoder.query(address, moveMarkerPopulateLatLong);
    });
  }

  function moveMarkerPopulateLatLong(err, data) {
    var lat = data.latlng[0];
    var lng = data.latlng[1];
    $eventLat.val(lat);
    $eventLng.val(lng);

    marker.setLatLng(data.latlng).update();
    map.panTo(data.latlng);
  }

  function populateAddress(err, data) {
    $eventAddress.val(data.features[0]["place_name"]);
  }

  marker.addTo(map);
  marker.on('dragend', ondragend);
  ondragend();
  geocodeAddress();
marker.addTo(map);
};
