// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers"

import { initMapbox } from '../plugins/init_mapbox';
import { initMapboxShow } from '../plugins/init_mapbox_show';
import { modalOpen } from "../plugins/modal_open";
import { readMore } from "../plugins/read_more";
import { initSweetalert } from '../plugins/init_sweetalert';

// import { initAutocomplete } from '../plugins/init_autocomplete';

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector(".restaurants-index")) {
    initMapbox();
  };
  if (document.querySelector(".restaurants-show")) {
    initMapboxShow();
  }
  modalOpen();
  readMore();
  // initAutocomplete();
  initSweetalert('#sweet-alert-demo', {
    title: "Added to collection",
    text: "Add more restaurants anytime!",
    icon: "success"
  });
})


// $(".crossRotate").click(function () {
//   if ($(this).css("transform") == 'none') {
//     $(this).css("transform", "rotate(45deg)");
//   } else {
//     $(this).css("transform", "");
//   }
// });

  // sweetalert js. call
