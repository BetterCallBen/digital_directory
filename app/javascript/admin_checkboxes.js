// Admin checkboxes functionality
document.addEventListener("turbo:load", function () {
  // Fonction pour mettre à jour l'apparence des checkboxes
  function updateCheckboxAppearance(checkbox) {
    const container = checkbox.closest(".checkbox-container");
    const visual = container.querySelector(".checkbox-visual");
    const check = container.querySelector(".checkbox-check");

    if (checkbox.checked) {
      visual.style.backgroundColor = "rgb(147 51 234)"; // purple-600
      visual.style.borderColor = "rgb(147 51 234)"; // purple-600
      check.style.opacity = "1";
      container.style.borderColor = "rgb(147 51 234)"; // purple-600
      container.style.backgroundColor = "rgb(250 245 255)"; // purple-50
    } else {
      visual.style.backgroundColor = "";
      visual.style.borderColor = "rgb(209 213 219)"; // gray-300
      check.style.opacity = "0";
      container.style.borderColor = "rgb(209 213 219)"; // gray-200
      container.style.backgroundColor = "";
    }
  }

  // Initialiser toutes les checkboxes au chargement
  const checkboxes = document.querySelectorAll(".checkbox-input");
  checkboxes.forEach(function (checkbox) {
    // Mettre à jour l'apparence initiale
    updateCheckboxAppearance(checkbox);

    // Ajouter l'écouteur d'événement
    checkbox.addEventListener("change", function () {
      updateCheckboxAppearance(this);
    });
  });
});
