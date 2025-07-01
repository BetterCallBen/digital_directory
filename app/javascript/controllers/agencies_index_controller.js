import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="agencies-index"
export default class extends Controller {
  connect() {
    this.setupAnimations();
  }

  setupAnimations() {
    // Observer pour les animations normales
    const observerOptions = {
      root: null,
      rootMargin: "0px 0px -10% 0px",
      threshold: 0.1,
    };

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          this.animateElement(entry.target);
          this.observer.unobserve(entry.target);
        }
      });
    }, observerOptions);

    // Observer pour les animations stagger
    this.staggerObserver = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          this.animateStaggerChildren(entry.target);
          this.staggerObserver.unobserve(entry.target);
        }
      });
    }, observerOptions);

    this.setupHeroSection();
    this.setupAgenciesSection();
    this.setupInfoSection();
    this.setupFaqSection();
    this.setupServiceBadges();
  }

  setupHeroSection() {
    // Illustration du héros
    const heroIllustration = this.element.querySelector(
      ".order-first.lg\\:order-last svg"
    );
    if (heroIllustration) {
      heroIllustration.parentElement.classList.add("animate-slide-right");
      this.observer.observe(heroIllustration.parentElement);
    }
  }

  setupAgenciesSection() {
    // Titre de la section agences
    const agenciesTitle = this.element.querySelector(
      "#agencies .text-left.mb-8"
    );
    if (agenciesTitle) {
      agenciesTitle.classList.add("animate-on-scroll");
      this.observer.observe(agenciesTitle);
    }

    // Grille des agences avec effet stagger
    const agenciesGrid = this.element.querySelector("#agencies .grid");
    if (agenciesGrid) {
      const agencyCards = agenciesGrid.querySelectorAll(".group.bg-white");
      agencyCards.forEach((card, index) => {
        card.classList.add("animate-scale-up", "stagger-item");
        card.style.setProperty("--delay", `${index * 150}ms`);
      });
      this.staggerObserver.observe(agenciesGrid);
    }
  }

  setupInfoSection() {
    const infoSection = this.element.querySelector(
      ".bg-gradient-to-br.from-gray-50"
    );
    if (infoSection) {
      infoSection.classList.add("animate-on-scroll");
      this.observer.observe(infoSection);
    }
  }

  setupFaqSection() {
    // Titre FAQ
    const faqTitle = this.element.querySelector(
      ".text-3xl.lg\\:text-4xl.font-bold"
    );
    if (faqTitle && faqTitle.textContent.includes("Questions")) {
      faqTitle.parentElement.classList.add("animate-slide-left");
      this.observer.observe(faqTitle.parentElement);
    }

    // Illustration FAQ
    const faqIllustration = this.element.querySelector(
      ".order-last.lg\\:order-first .relative"
    );
    if (faqIllustration) {
      faqIllustration.classList.add("animate-slide-right");
      this.observer.observe(faqIllustration);
    }

    // FAQ Items avec effet stagger
    const faqItems = this.element.querySelectorAll(
      ".space-y-4 > .group.border"
    );
    faqItems.forEach((item, index) => {
      item.classList.add("animate-on-scroll", "animate-stagger");
      item.style.setProperty("--delay", `${index * 50}ms`);
      this.observer.observe(item);
    });
  }

  setupServiceBadges() {
    const serviceBadges = this.element.querySelectorAll(
      ".flex.items-center.gap-2.bg-white\\/70"
    );
    serviceBadges.forEach((badge, index) => {
      badge.classList.add("animate-scale-up", "animate-stagger");
      badge.style.setProperty("--delay", `${index * 100}ms`);
      this.observer.observe(badge);
    });
  }

  animateElement(element) {
    const animationClass = this.getAnimationClass(element);
    const delay = parseInt(element.style.getPropertyValue("--delay") || "0");

    setTimeout(() => {
      element.classList.add("animate-visible", animationClass);
    }, delay);
  }

  animateStaggerChildren(container) {
    const staggerItems = container.querySelectorAll(".stagger-item");
    staggerItems.forEach((item, index) => {
      const delay = parseInt(
        item.style.getPropertyValue("--delay") || `${index * 100}`
      );
      setTimeout(() => {
        item.classList.add("animate-visible");
      }, delay);
    });
  }

  getAnimationClass(element) {
    if (element.classList.contains("animate-slide-left"))
      return "animate-slide-left";
    if (element.classList.contains("animate-slide-right"))
      return "animate-slide-right";
    if (element.classList.contains("animate-scale-up"))
      return "animate-scale-up";
    return "animate-fade-in-up";
  }

  disconnect() {
    if (this.observer) this.observer.disconnect();
    if (this.staggerObserver) this.staggerObserver.disconnect();
  }
}
