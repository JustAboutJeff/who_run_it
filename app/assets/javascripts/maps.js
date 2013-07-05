$(document).ready(function() {

  var routeLayer = L.layerGroup();
  var map = L.mapbox.map('map', 'mthoover1.map-nnfbdcbz', { layers: routeLayer })
  .setView([41.889451, -87.637145], 15);

  // var geolocate = document.getElementById('geolocate');

  // // This uses the HTML5 geolocation API, which is available on
  // // most mobile browsers and modern browsers, but not in Internet Explorer
  // //
  // // See this chart of compatibility for details:
  // // http://caniuse.com/#feat=geolocation
  // if (!navigator.geolocation) {
  //     geolocate.innerHTML = 'geolocation is not available';
  // } else {
  //     geolocate.onclick = function (e) {
  //         e.preventDefault();
  //         e.stopPropagation();
  //         map.locate();
  //     };
  // }

  // // Once we've got a position, zoom and center the map
  // // on it, and add a single marker.
  // map.on('locationfound', function(e) {
  //     map.fitBounds(e.bounds);

  //     map.markerLayer.setGeoJSON({
  //         type: "Feature",
  //         geometry: {
  //             type: "Point",
  //             coordinates: [e.latlng.lng, e.latlng.lat]
  //         },
  //         properties: {
  //             'marker-color': '#000',
  //             'marker-symbol': 'star-stroked'
  //         }
  //     });

  //     // And hide the geolocation button
  //     geolocate.parentNode.removeChild(geolocate);
  // });

  // // If the user chooses not to allow their location
  // // to be shared, display an error message.
  // map.on('locationerror', function() {
  //     geolocate.innerHTML = 'position could not be found';
  // });

  var waypoints = [];
  var info = L.control();

  info.onAdd = function(map) {
    this._div = L.DomUtil.create('div', 'info');
    this.update();
    return this._div;
  }

  info.update = function(distance) {
    this._div.innerHTML = '<h4>Total Distance</h4>' + (distance ? '<span>' + distance.toFixed(2) + ' miles</span>': '<span>Create a route</span>');
  }

  info.addTo(map);

  var reset = L.control();

  reset.onAdd = function(map) {
    this._div = L.DomUtil.create('div', 'reset');
    this._div.innerHTML = '<button type="button" id="reset">Reset Route</button>';
    this.update();
    return this._div;
  }

  reset.update = function() {
    waypoints = [];
    info.update();
  }

  reset.addTo(map);


  map.on('click', function(e) { 
    L.marker(e.latlng).addTo(routeLayer);
    waypoints.push(e.latlng);
    if (waypoints.length > 1) {
      L.polyline(waypoints).addTo(routeLayer);
      var totalDistance = 0;
      for (i = 0; i < (waypoints.length - 1); i++) {
        totalDistance += waypoints[i].distanceTo(waypoints[i+1]);
      }
      info.update(totalDistance*0.000621371);
    }
    console.log(waypoints);
  });


  $('#map').on('click', '#reset', function(e) {
    e.stopPropagation();
    e.preventDefault();
    routeLayer.clearLayers();
    reset.update();
  });

  $('form').submit(function(event) {
    event.preventDefault;
    event.stopPropagation;
    convertedWaypoints = []
    for (i = 0; i < waypoints.length; i++) {
      convertedWaypoints.push([waypoints[i].lat, waypoints[i].lng])
    }
    console.log(convertedWaypoints);
    return false;
  });

});
