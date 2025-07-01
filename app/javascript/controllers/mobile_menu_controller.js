import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["button", "menu"];

  connect() {
    this.isOpen = false;
    console.log("Mobile menu controller connected");
  }

  toggle() {
    if (this.isOpen) {
      this.close();
    } else {
      this.open();
    }
  }

  open() {
    // Ouvrir le menu
    this.menuTarget.style.maxHeight = this.menuTarget.scrollHeight + "px";
    this.menuTarget.style.opacity = "1";
    this.isOpen = true;
  }

  close() {
    // Fermer le menu
    this.menuTarget.style.maxHeight = "0px";
    this.menuTarget.style.opacity = "0";
    this.isOpen = false;
  }

  // Fermer le menu si on clique en dehors
  clickOutside(event) {
    if (!this.element.contains(event.target) && this.isOpen) {
      this.close();
    }
  }

  // Méthode appelée quand le contrôleur est connecté
  initialize() {
    // Écouter les clics en dehors du menu
    document.addEventListener("click", this.clickOutside.bind(this));
  }

  // Nettoyer les event listeners quand le contrôleur est déconnecté
  disconnect() {
    document.removeEventListener("click", this.clickOutside.bind(this));
  }
}
