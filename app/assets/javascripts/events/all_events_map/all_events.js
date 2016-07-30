$(function(){
  if(document.getElementById('canvas-form') !== null) {
  document.getElementById('canvas-form').onclick = addFormLayer;
}
});

var clicked = false;
var $searchBox;
var $eventAddress;
var $eventLat;
var $eventLng;
var $address;
var geocoder;
var $geolocate;
var marker;
var map;
function drawBaseMap() {
  L.mapbox.accessToken = "pk.eyJ1IjoibGl6dmRrIiwiYSI6IlJodmpRdzQifQ.bUxjjqfXrx41XRFS7cXnIA";
  map = L.mapbox.map('map', 'mapbox.satellite', { zoomControl: false });
  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);
  map.fitBounds([
    [42.346397049733944, -71.1029577255249],
    [42.369451896762385, -71.04429244995117],
  ]);
  map.setView([29.525294, -60.562068], 4);
}

function addMarkerLayer(){
  drawBaseMap();
  $.ajax({
    url: '/api/pollution_events',
    method: 'GET'
  })
  .done(function(data){
    data.events.forEach(function(pevent){
      var latlng = L.latLng(pevent.event_lat, pevent.event_lng);
      L.circleMarker(latlng, {radius: 6, color: '#9F0A28', fillOpacity: .7, weight: 5})
      .bindPopup("<a href=#show-" + pevent.id + " id=canvas-show class='button quiet'>" + pevent.title  + "</a>" + "<p class='pop-description'>" + pevent.address  + "<br>" + pevent.description + "<p>")
      .addTo(map);
    });
  });
}


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

function addFormLayer(){
    marker = L.marker(new L.LatLng(29.525294, -60.562068), {
    icon: L.mapbox.marker.icon({'marker-color': '#11644D', 'marker-size' : 'large' }),
    draggable: true
  });
  geocoder = L.mapbox.geocoder('mapbox.places');

   $searchBox = $('.leaflet-control-mapbox-geocoder-form').children().first();
   $eventAddress = $('#pollution_event_address');
   $eventLat = $('#pollution_event_event_lat');
   $eventLng = $('#pollution_event_event_lng');
   $address = $eventAddress.val();
   $geolocate = $('#geolocate');
  map.fitBounds([
    [42.346397049733966, -71.1029577255249],
    [42.369451896762385, -71.04429244995117]
    ]);
    map.setView([29.525294, -60.562068], 3);

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

  if(clicked === false){
    marker.addTo(map);
    clicked = true;
  }
  marker.on('dragend', ondragend);
  ondragend();
  geocodeAddress();
  $("#close-button").click(function() {
    clicked = false;
    map.removeLayer(marker);
  });
  $("#canvas-list").click(function() {
    clicked = false;
    map.removeLayer(marker);
  });
}

function flyToMarker(){
  $.ajax({
    url: '/api/pollution_events',
    method: 'GET'
  })
  .done(function(data){
    data.events.forEach(function(listedevent){
      document.getElementById("location-fly-" + listedevent.id).addEventListener("click", function () {
        L.mapbox.accessToken = "pk.eyJ1IjoibGl6dmRrIiwiYSI6IlJodmpRdzQifQ.bUxjjqfXrx41XRFS7cXnIA";
        map.panTo(new L.LatLng(listedevent.event_lat, listedevent.event_lng), 9);
        });
      });
    });
  }
