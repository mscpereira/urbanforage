import mapboxgl from 'mapbox-gl/dist/mapbox-gl-csp';
import MapboxWorker from 'worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker';

mapboxgl.workerClass = MapboxWorker;

// import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement, marker) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  return new mapboxgl.Map({
    container: 'map-show',
    // style: 'mapbox://styles/araujopaulo/ckweycuwa3foy15su18576pk9',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: marker,
    center: [-9.1393, 38.7223],
    zoom: 12
  });
};

const addMarkersToMap = (map, marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.info_window);

  const element = document.createElement('div');
  element.className = 'marker';
  //element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'cover';
  element.style.width = '18px';
  element.style.height = '30px';

  new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
};

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([marker.lng, marker.lat]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapboxShow = () => {
  const mapElement = document.getElementById('map-show');

  if (mapElement) {
    const marker = JSON.parse(mapElement.dataset.marker);
    const map = buildMap(mapElement, marker);
    addMarkersToMap(map, marker);
    fitMapToMarker(map, marker);
  }
};

export { initMapboxShow };
