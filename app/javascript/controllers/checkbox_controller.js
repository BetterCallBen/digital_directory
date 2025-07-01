import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="checkbox"
export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log("Checkbox controller connected");
    this.updateAllCheckboxes();
  }

  // Called when a checkbox is toggled
  toggle(event) {
    console.log("Toggle called", event.target);
    const checkbox = event.target;
    const label = checkbox.closest("label");

    if (label) {
      this.updateCheckboxAppearance(checkbox, label);
    }
  }

  // Update all checkboxes on connect
  updateAllCheckboxes() {
    this.inputTargets.forEach((checkbox) => {
      const label = checkbox.closest("label");
      if (label) {
        this.updateCheckboxAppearance(checkbox, label);
      }
    });
  }

  // Update the visual appearance of a specific checkbox
  updateCheckboxAppearance(checkbox, label) {
    console.log(
      "Updating appearance for",
      checkbox,
      "checked:",
      checkbox.checked
    );

    const checkContainer = label.querySelector("div.flex-shrink-0");
    let checkIcon = label.querySelector("svg");

    if (checkbox.checked) {
      // État sélectionné - bordure violette et check violet
      label.classList.remove("border-gray-300", "hover:border-purple-300");
      label.classList.add("border-purple-600");

      if (checkContainer) {
        checkContainer.classList.remove("border-gray-300", "bg-white");
        checkContainer.classList.add("border-purple-600", "bg-purple-600");
      }

      if (!checkIcon) {
        // Créer l'icône check si elle n'existe pas
        const svg = document.createElement("svg");
        svg.className = "w-3 h-3 text-white";
        svg.setAttribute("fill", "currentColor");
        svg.setAttribute("viewBox", "0 0 20 20");
        svg.innerHTML =
          '<path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>';
        checkContainer.appendChild(svg);
        checkIcon = svg;
      } else {
        checkIcon.style.display = "block";
        checkIcon.className = "w-3 h-3 text-white";
      }
    } else {
      // État non sélectionné - bordure grise
      label.classList.remove("border-purple-600");
      label.classList.add("border-gray-300", "hover:border-purple-300");

      if (checkContainer) {
        checkContainer.classList.remove("border-purple-600", "bg-purple-600");
        checkContainer.classList.add("border-gray-300", "bg-white");
      }

      if (checkIcon) {
        checkIcon.style.display = "none";
      }
    }
  }
}
