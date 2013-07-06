$(document).ready(function() {
  if ($('#map-location').length) {
  var mapLocation = L.mapbox.map('map-location', 'mthoover1.map-nnfbdcbz')
  .setView(coords, 16)

  L.marker(coords).addTo(mapLocation);
  }
});
