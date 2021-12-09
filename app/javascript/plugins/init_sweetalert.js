import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButtons = document.querySelectorAll(selector);
  //console.log(swalButtons);
  if (swalButtons) { // protect other pages
    swalButtons.forEach(button =>
    button.addEventListener('click', () => {
      swal(options);
    }));
  }
};

export { initSweetalert };
