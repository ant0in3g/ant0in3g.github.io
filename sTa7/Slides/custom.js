document.addEventListener("DOMContentLoaded", function() {
  const slideNumberDiv = document.getElementById("custom-slide-number");

  function updateSlideNumber() {
    const indices = Reveal.getIndices();
    const slideNumber = indices.h + 1 + '/' + Reveal.getTotalSlides();
    slideNumberDiv.innerText = slideNumber;
  }

  Reveal.on('slidechanged', updateSlideNumber);
  updateSlideNumber();
});
