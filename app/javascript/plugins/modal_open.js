const modalOpen = () => {
  const button = document.getElementById("modal-button");
  const feedback = document.querySelector(".invalid-feedback")
  if (feedback && button) {
    button.click();
  }
}

export { modalOpen };
