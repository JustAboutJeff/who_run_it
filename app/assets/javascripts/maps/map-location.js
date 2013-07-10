$(document).ready(function() {
  if ($('#map-location').length) {
    var mapLocation = L.mapbox.map('map-location', 'mthoover1.map-nnfbdcbz', {scrollWheelZoom: false})

    var circle = L.circle(coords, (search_radius*1609.34)).addTo(mapLocation);
    mapLocation.fitBounds(circle);

    L.marker(coords).addTo(mapLocation);
  }
});
