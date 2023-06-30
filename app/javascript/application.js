// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// application.js
document.addEventListener("DOMContentLoaded", function () {
  var openModalButton = document.getElementById("openModalButton");
  var closeModalButton = document.getElementById("closeModalButton");
  var modal = document.getElementById("myModal");

  openModalButton.addEventListener("click", function () {
    modal.style.display = "block";
  });

  closeModalButton.addEventListener("click", function () {
    modal.style.display = "none";
  });
});

window.addEventListener("click", function (event) {
  if (event.target == modal) {
    closeModal();
  }
});

function closeModal() {
  modal.style.display = "none";
}

// Execute the closeModal function when the user leaves the modal page
window.addEventListener("beforeunload", function () {
  closeModal();
});
