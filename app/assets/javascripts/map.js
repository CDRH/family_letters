// CREATE LAYER FOR MAP TILES
var baseLayer = L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
  maxZoom: 19,
  attributionControl: false
});

// ADD MAP
var map = L.map("map", {
    center: new L.LatLng(36, -90),
    zoom: 6,
    layers: [baseLayer]
});

var attribution = L.control.attribution({
  position: 'bottomleft',
  prefix: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Tiles style by <a href="https://www.hotosm.org/" target="_blank">Humanitarian OpenStreetMap Team</a> hosted by <a href="https://openstreetmap.fr/" target="_blank">OpenStreetMap France</a>'

});
attribution.addTo(map);

function buildLink(items) {
  var count = items.length;
  var ids = []
  for (var i=0; i<count; i++) {
    ids.push(items[i]["identifier"])
  }
  return searchPath+"?q=identifier:("+ids.join(" OR ")+")";
}

function buildTitle(locations) {
  // location is always an array but may only have one item
  // so just join if multiple
  return props["locations"].join(joiner);
}

// BIND POPUP TO DESTINATION
function onEachFeatureBuilder(feature, layer, type, label) {
  props = feature.properties;
  title = buildTitle(props["locations"])
  html = "<div class='map_feature'>";
  html += "<strong>" + title + "</strong>";
  linkLabel = props["count"]+" "+label;
  searchLink = buildLink(props[type]);
  html += "<p><a href=\""+searchLink+"\">"+linkLabel+"</a></p>";
  html += "</div>";
  layer.bindPopup(html);
};

function sizeCount(props) {
  count = props.count;
  // one location has 81, the others much fewer
  // so using less than half the biggest to give
  // the others some size to work with
  percent = count/30;
  // scale up just a bit
  size = percent*15;
  // some simply too small to see / interact with
  if (size < 3) size = 4;
  // it's just too big!
  if (size > 30) size = 20;
  return size;
}
