$(document).ready(function() {

  if ($('#map-show').length) {
  var routeLayer = L.layerGroup();
  var mapShow = L.mapbox.map('map-show', 'mthoover1.map-nnfbdcbz', {layers: routeLayer})
  mapShow.fitBounds(waypoints);

  var line = L.polyline(waypoints), animatedMarker = L.animatedMarker(line.getLatLngs());
  mapShow.addLayer(animatedMarker);

  var route = L.polyline(waypoints).addTo(mapShow);
  var start = L.marker(waypoints[0]).addTo(mapShow);
  var finish = L.marker(waypoints.slice(-1)[0]).addTo(mapShow);
  }
});
