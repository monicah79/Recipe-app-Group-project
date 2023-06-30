document.addEventListener("DOMContentLoaded", function () {
  var openModalButton = document.getElementById("openModalButton");
  var closeModalButton = document.getElementById("closeModalButton");
  var generateButton = document.getElementById("generate-shopping-list");

  var modal = document.getElementById("myModal");

  openModalButton.addEventListener("click", function () {
    modal.style.display = "block";
  });

  closeModalButton.addEventListener("click", function () {
    closeModal();
  });

  generateButton.addEventListener("click", function () {
    closeModal();
  });

  window.addEventListener("click", function (event) {
    if (event.target == modal) {
      closeModal();
    }
  });

  function closeModal() {
    modal.style.display = "none";
  }
});

window.addEventListener("beforeunload", function () {
  closeModal();
});
