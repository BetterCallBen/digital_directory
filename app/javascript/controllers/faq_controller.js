import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="faq"
export default class extends Controller {
  static targets = ["content", "icon"];

  toggle() {
    const content = this.contentTarget;
    const icon = this.iconTarget;
    const isOpen = content.style.maxHeight && content.style.maxHeight !== "0px";

    // Fermer tous les autres FAQ
    document
      .querySelectorAll('[data-controller="faq"]')
      .forEach((faqController) => {
        if (faqController !== this.element) {
          const otherContent = faqController.querySelector(
            '[data-faq-target="content"]'
          );
          const otherIcon = faqController.querySelector(
            '[data-faq-target="icon"]'
          );

          if (otherContent) {
            otherContent.style.maxHeight = "0px";
          }
          if (otherIcon) {
            otherIcon.style.transform = "rotate(0deg)";
          }
        }
      });

    // Toggle le FAQ actuel
    if (isOpen) {
      content.style.maxHeight = "0px";
      icon.style.transform = "rotate(0deg)";
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
      icon.style.transform = "rotate(180deg)";
    }
  }
}
