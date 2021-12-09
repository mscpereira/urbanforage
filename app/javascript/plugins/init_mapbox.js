import mapboxgl from 'mapbox-gl/dist/mapbox-gl-csp';
import MapboxWorker from 'worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker';

mapboxgl.workerClass = MapboxWorker;

import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  return new mapboxgl.Map({
    container: 'map',
    // style: 'mapbox://styles/araujopaulo/ckweycuwa3foy15su18576pk9',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [-9.1393, 38.7223],
    zoom: 13,
    bearing: 27,
    pitch: 45
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    // const element = document.createElement('div');
    // element.className = 'marker';
    // element.id = 'hello';
    // // element.style.backgroundImage = `url('UF-favicon.png.image_url')`;
    // element.style.backgroundSize = 'cover';
    // element.style.width = '18px';
    // element.style.height = '30px';

    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {

    const markers = JSON.parse(mapElement.dataset.markers);
    let chapters = {}
    markers.forEach(marker =>
      chapters[`restaurant-card-${marker.id}`] = {
        bearing: 10,
        center: [marker.lng, marker.lat],
        zoom: 15.5,
        pitch: 20
      }
    );
    const map = buildMap(mapElement);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    let activeChapterName = `restaurant-card-${markers[0].id}`;
    function setActiveChapter(chapterName) {
      if (chapterName === activeChapterName) return;

      map.jumpTo(chapters[chapterName]);

      document.getElementById(chapterName).classList.add('active');
      document.getElementById(activeChapterName).classList.remove('active');

      activeChapterName = chapterName;
    }

    function isElementOnScreen(id) {
      const element = document.getElementById(id);
      const bounds = element.getBoundingClientRect();
      return bounds.top < window.innerHeight && bounds.bottom > 0;
    }

    // On every scroll event, check which element is on screen
    window.onscroll = () => {
      for (const chapterName in chapters) {
        //console.log(chapterName);
        if (isElementOnScreen(chapterName)) {
          // try to close all popups
          // hovermarker.closeOnMove();
          setActiveChapter(chapterName);
          markers.forEach((marker) => {
            if(`restaurant-card-${marker.id}` == chapterName) {
              // console.log("match");
              const popup = new mapboxgl.Popup().setHTML(marker.info_window);
              const hovermarker = new mapboxgl.Marker()
              .setLngLat(chapters[chapterName].center)
              .setPopup(popup)
              .addTo(map);
              map.on('closeAllPopups', () => {
                popup.remove();
              });
              map.fire('closeAllPopups');
              hovermarker.togglePopup();
              // hovermarker.remove();
            }
          })
          break;
        }
      }
    };
  }






};
export { initMapbox }
