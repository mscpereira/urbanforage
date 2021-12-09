// const text = document.querySelector('.text-overflow');

const readMore = () => {
  const reviewPara = document.getElementById('table');
  if (reviewPara) {
    let elements = document.querySelectorAll("em");
    elements.forEach((element) => {
      if (element.offsetHeight > 41) {
        console.log(element)
        // btn.classList.add("disabled-button")
        element.parentElement.nextElementSibling.classList.remove("hidden-btn")
      }
    })
    const allBtn = document.querySelectorAll('.btn-overflow');
    allBtn.forEach((btn) => {
      // console.log(btn)
      // console.log(elementHeight)
      btn.addEventListener("click", (event) => {
        // console.log(event.path[1].firstElementChild);
        const textElement = event.path[1].firstElementChild;
        textElement.classList.toggle("review-para");
        if (event.target.innerHTML === "Show more...") {
          event.target.innerHTML = "Show less...";
        } else {
          event.target.innerHTML = "Show more...";
        }
      });
    });
  }
}

export { readMore }
