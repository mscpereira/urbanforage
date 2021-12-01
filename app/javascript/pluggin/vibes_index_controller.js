const selectcards = () => {
  const elements = document.querySelectorAll(".cards-vibe-label").forEach((vibe) => {
    vibe.addEventListener("click", (event) => {
      console.log("TESTE")
      vibe.classList.toggle("cards-vibe-checked");
    });
  });
}

export { selectcards }
