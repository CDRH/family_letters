function degreeOfSpanish(props) {
  // calculate percent in spanish
  es = Number(props.es) || 0;
  en = Number(props.en) || 0;

  perc_es = es/(es+en);

  color = "grey";
  if (perc_es >= .75) {
    color = "#2CB3E6";
  } else if (perc_es <= .25) {
    color = "#E74E64"
  } else if (perc_es) {
    color = "#861994"
  }
  return color;
}

// candidate for generalizing
function geoJsonLayer(json) {
  return L.geoJSON(json, {
    onEachFeature: function(feature, layer) {
      return onEachFeatureBuilder(feature, layer, "letters", label)
    },
    pointToLayer: function(feature, latlng) {
      return L.circleMarker(latlng, markerOptions(feature));
    },
    style: function(feature) {
      // only draw for the lines
      if (feature.geometry.type == "LineString") {
        color = degreeOfSpanish(feature.properties);
        size = sizeCount(feature.properties);
        return { color: color, weight: size, opacity: 0.5 }
      }
    }
  });
}

// STYLE DESTINATION CIRCLES
function markerOptions(feature) {
  props = feature.properties;
  size = sizeCount(props);
  color = degreeOfSpanish(props)

  return {
    radius: size,
    color: "black",
    opacity: 1,
    weight: 0.2,
    fillColor: color,
    fillOpacity: 0.6
  }
};
