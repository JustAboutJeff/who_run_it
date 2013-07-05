$(document).ready(function() {

  var map = L.mapbox.map('map', 'mthoover1.map-nnfbdcbz')
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

  map.on('click', function(e) { 
    L.marker(e.latlng).addTo(map);
    waypoints.push(e.latlng);
    if (waypoints.length > 1) {
      L.polyline(waypoints).addTo(map);
      var totalDistance = 0;
      for (i = 0; i < (waypoints.length - 1); i++) {
        totalDistance += waypoints[i].distanceTo(waypoints[i+1]);
      }
      console.log(totalDistance*0.000621371 + ' miles');
    }
    console.log(waypoints);
  });


});
