$(document).ready(function() {

  var routeLayer = L.layerGroup();
  var map = L.mapbox.map('map', 'mthoover1.map-nnfbdcbz', {layers: routeLayer})
  map.locate({setView: true, maxZoom: 16});

  var waypoints = [];

  var drawnItems = new L.FeatureGroup();
  map.addLayer(drawnItems);

  var drawControl = new L.Control.Draw({

    draw: {
      position: 'topleft',
      polyline: {
        shapeOptions: {
        color: "#2c3e59",
        weight: 8,
        opacity: 0.8
        }
      },
      polygon: false,
      rectangle: false,
      circle: false
    },

    edit: {
      featureGroup: drawnItems,
      edit: false
    }
  });

  map.addControl(drawControl);

  map.on('draw:created', function(e) {
    var type = e.layerType
        layer = e.layer;

    if (type === 'polyline') {

      waypoints = [];
      for (i=0; i < (e.layer._latlngs.length); i++) {
        waypoints.push([e.layer._latlngs[i].lat, e.layer._latlngs[i].lng])
      }

      var totalDistance = 0;
      for (i = 0; i < (waypoints.length - 1); i++) {
        totalDistance += e.layer._latlngs[i].distanceTo(e.layer._latlngs[i+1]);
      }
    }

    $('#waypoints').val(waypoints);
    $('#distance').val(totalDistance);

    drawnItems.addLayer(layer);
  });

});
