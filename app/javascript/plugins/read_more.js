// const text = document.querySelector('.text-overflow');

const readMore = () => {
  const reviewPara = document.querySelector('.teste');
  const allBtn = document.querySelectorAll('.btn-overflow');
  allBtn.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      console.log("hey");
      if (reviewPara) {
        reviewPara.classList.toggle("review-para");
        if (event.target.innerHTML === "Show more...") {
          event.target.innerHTML = "Show less...";
        } else {
          event.target.innerHTML = "Show more...";
        }
      }

  })

  });
}


export { readMore }
