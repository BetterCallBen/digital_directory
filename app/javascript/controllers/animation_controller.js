import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="animation"
export default class extends Controller {
  static targets = ["element"];
  static values = {
    animation: String,
    delay: Number,
    threshold: Number,
  };

  connect() {
    this.setupObserver();
    this.observeElements();
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect();
    }
  }

  setupObserver() {
    const observerOptions = {
      root: null,
      rootMargin: "0px 0px -10% 0px",
      threshold: this.thresholdValue || 0.1,
    };

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          this.animateElement(entry.target);
        }
      });
    }, observerOptions);
  }

  observeElements() {
    // Observe all elements with animate-on-scroll class within this controller
    const animatedElements =
      this.element.querySelectorAll(".animate-on-scroll");

    animatedElements.forEach((element) => {
      this.prepareElement(element);
      this.observer.observe(element);
    });

    // Also observe direct targets
    this.elementTargets.forEach((element) => {
      this.prepareElement(element);
      this.observer.observe(element);
    });
  }

  prepareElement(element) {
    // Set initial state
    element.classList.add("opacity-0");

    const animation =
      element.dataset.animation || this.animationValue || "fade-in-up";

    if (animation.includes("fade-in-up")) {
      element.classList.add("translate-y-8");
    }
    if (animation.includes("zoom-in")) {
      element.classList.add("scale-95");
    }
    if (animation.includes("slide-in-left")) {
      element.classList.add("-translate-x-8");
    }
    if (animation.includes("slide-in-right")) {
      element.classList.add("translate-x-8");
    }
  }

  animateElement(element) {
    const animation =
      element.dataset.animation || this.animationValue || "fade-in-up";
    const delay = parseInt(element.dataset.delay || this.delayValue || 0);

    // Apply animation with delay
    setTimeout(() => {
      element.classList.add("animate-" + animation);
      element.classList.remove(
        "opacity-0",
        "translate-y-8",
        "scale-95",
        "-translate-x-8",
        "translate-x-8"
      );
    }, delay);

    // Stop observing this element
    this.observer.unobserve(element);
  }

  // Action method that can be called directly
  triggerAnimation() {
    this.elementTargets.forEach((element) => {
      this.animateElement(element);
    });
  }
}
