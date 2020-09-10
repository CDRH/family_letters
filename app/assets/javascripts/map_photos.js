function markerOptions(feature) {
  props = feature.properties;
  size = sizeCount(props);
  color = "#861994";

  return {
    radius: size,
    color: "black",
    opacity: 1,
    weight: 0.2,
    fillColor: color,
    fillOpacity: 1
  }
};

var photos = L.geoJSON(geojson, {
  onEachFeature: function(feature, layer) {
    onEachFeatureBuilder(feature, layer, "photos", label)
  },
  pointToLayer: function(feature, latlng) {
    return L.circleMarker(latlng, markerOptions(feature));
  }
});

photos.addTo(map);
map.fitBounds(photos.getBounds());
