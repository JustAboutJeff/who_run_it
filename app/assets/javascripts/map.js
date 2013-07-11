// Logic for map on View Event page
var MapShow = {
  initialize: function(){
    if (this.mapExists()) {
      this.setDefaults();
      this.positionMap();
      this.addRouteToMap();
      this.addStartMarkerToMap();
      this.addFinishMarkerToMap();
      this.populateAnimatedWaypoints();
      this.buildLine();
      this.buildAnimatedMarker();
      this.addAnimatedMarkerToMap();
    }
  },
  mapExists: function(){
    return $('#map-show').length > 0;
  },
  setDefaults: function(){
    this.routeLayer = L.layerGroup();
    this.map = L.mapbox.map('map-show',
                  'mthoover1.map-nnfbdcbz',
                  {  layers: this.routeLayer,
                     scrollWheelZoom: false  });
    this.animatedWaypoints = [waypoints[0]];
    this.route = L.polyline(waypoints, { color: '#dff531' });
    this.start = L.marker(waypoints[0]);
    this.finish = L.marker(waypoints.slice(-1)[0]);
  },
  positionMap: function(){
    this.map.fitBounds(waypoints);
  },
  populateAnimatedWaypoints: function(){
    for (i = 0; i < waypoints.length; i++) {
      this.animatedWaypoints.push(waypoints[i]);
    }
  },
  addRouteToMap: function(){
    this.route.addTo(this.map);
  },
  addStartMarkerToMap: function(){
    this.start.addTo(this.map);
  },
  addFinishMarkerToMap: function(){
    this.finish.addTo(this.map);
  },
  buildLine: function(){
    this.line = L.polyline(this.animatedWaypoints);
  },
  buildAnimatedMarker: function(){
    this.animatedMarker = L.animatedMarker(this.line.getLatLngs());
  },
  addAnimatedMarkerToMap: function(){
    this.map.addLayer(this.animatedMarker);
  }
};

// Logic for map on Run Alert page
var MapLocation = {
  initialize: function(){
    if (this.mapExists()) {
      this.setDefaults();
      this.positionMap();
      this.addMarkerToMap();
    }
  },
  mapExists: function(){
    return $('#map-location').length > 0;
  },
  setDefaults: function(){
    this.map = L.mapbox.map('map-location', 'mthoover1.map-nnfbdcbz', 
                           {scrollWheelZoom: false});
    this.circle = L.circle(coords, (search_radius*1609.34), 
                          { color: '#5f506d', weight: 2 }).addTo(this.map);
  },
  positionMap: function(){
    this.map.fitBounds(this.circle);
  },
  addMarkerToMap: function(){
    L.marker(coords).addTo(this.map);
  }
};

// Logic for map on Create Event page
var MapCreate = {
  initialize: function(){
    if (this.mapExists()) {
      this.setDefaults();
      this.addDrawLayerToMap();
      this.addMapDrawControl();
      this.removeTrashCanIcon();

      $('#reset').on('click', function(){
        MapCreate.waypoints = [];
        MapCreate.map.removeLayer(layer);
        MapCreate.resetDistanceFormData();
        MapCreate.resetWaypointFormData();
      });

      this.map.on('draw:created', function(e) {
        var type = e.layerType;
            layer = e.layer;
        if (type === 'polyline') {
          MapCreate.updateWaypoints(e);
          MapCreate.updateDistance(e);
        }
        MapCreate.updateWaypointsFormData();
        MapCreate.updateDistanceFormData();
        MapCreate.drawnItems.addLayer(layer);
      });
    }
  },
  mapExists: function(){
    return $('#map-create').length > 0;
  },
  setDefaults: function(){
    this.routeLayer = L.layerGroup();
    this.map = L.mapbox.map('map-create', 'mthoover1.map-nnfbdcbz', {layers: this.routeLayer,
                                                               scrollWheelZoom: false});
    this.waypoints = [];
    this.totalDistance = 0;
    this.drawnItems = new L.FeatureGroup();
    this.drawControl = new L.Control.Draw({
      draw: {
        position: 'topleft',
        polyline: {
          shapeOptions: {
            color: "#dff531",
            weight: 8,
            opacity: 0.8
          }
        },
        marker: false,
        polygon: false,
        rectangle: false,
        circle: false
      },
      edit: {
        featureGroup: new L.FeatureGroup(),
        edit: false
      }
    });
  },
  addDrawLayerToMap: function(){
    this.map.addLayer(this.drawnItems);
  },
  resetWaypointFormData: function(){
    $('#waypoints').val("");
  },
  resetDistanceFormData: function(){
    $('#distance').val("");
  },
  addMapDrawControl: function(){
    this.map.addControl(this.drawControl);
  },
  removeTrashCanIcon: function(){
    $('.leaflet-draw-section:last').remove();
  },
  updateWaypoints: function(e){
    this.waypoints = [];
    for (i=0; i < (e.layer._latlngs.length); i++) {
      this.waypoints.push([e.layer._latlngs[i].lat, e.layer._latlngs[i].lng]);
    }
  },
  updateDistance: function(e){
    this.totalDistance = 0;
    for (i = 0; i < (waypoints.length - 1); i++) {
      this.totalDistance += e.layer._latlngs[i].distanceTo(e.layer._latlngs[i+1]);
    }
  },
  updateWaypointsFormData: function(){
    $('#waypoints').val(this.waypoints);
  },
  updateDistanceFormData: function(){
    $('#distance').val(this.totalDistance);
  }
};
