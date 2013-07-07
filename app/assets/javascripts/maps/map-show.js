$(document).ready(function() {
  if ($('#map-show').length) {
    var routeLayer = L.layerGroup();
    var mapShow = L.mapbox.map('map-show', 'mthoover1.map-nnfbdcbz', {layers: routeLayer})
    mapShow.fitBounds(waypoints);

    var route = L.polyline(waypoints).addTo(mapShow);
    var start = L.marker(waypoints[0]).addTo(mapShow);
    var finish = L.marker(waypoints.slice(-1)[0]).addTo(mapShow);

    animatedWaypoints = [waypoints[0]];
    for (i = 0; i < waypoints.length; i++) {
      animatedWaypoints.push(waypoints[i]);
    }

    var line = L.polyline(animatedWaypoints), animatedMarker = L.animatedMarker(line.getLatLngs());
    mapShow.addLayer(animatedMarker);
  }
});
