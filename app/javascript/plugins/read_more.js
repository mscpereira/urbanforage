// const text = document.querySelector('.text-overflow');

const readMore = () => {
  const reviewPara = document.getElementById('table');
  if (reviewPara) {
    const elementHeight = document.querySelectorAll(".review-para")[2].offsetHeight
    const allBtn = document.querySelectorAll('.btn-overflow');
    allBtn.forEach((btn) => {
      if (elementHeight > 38) {
        btn.classList.add("disabled-button")
      }
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
