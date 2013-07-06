$(document).ready(function() {

  if ($('#map-show').length) {
  var routeLayer = L.layerGroup();
  var mapShow = L.mapbox.map('map-show', 'mthoover1.map-nnfbdcbz', {layers: routeLayer})
  mapShow.setView(center_point, 13)

  var route = L.polyline(waypoints).addTo(mapShow);
  var start = L.marker(waypoints[0]).addTo(mapShow).bindPopup("I am a green leaf.");
  var finish = L.marker(waypoints.slice(-1)[0]).addTo(mapShow);
  }
});
