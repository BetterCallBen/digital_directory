// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// Animation on scroll functionality
document.addEventListener("DOMContentLoaded", function () {
  const observerOptions = {
    root: null,
    rootMargin: "0px 0px -10% 0px",
    threshold: 0.1,
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const element = entry.target;
        const animation = element.dataset.animation || "fade-in-up";
        const delay = element.dataset.delay || "0";

        // Apply animation with delay
        setTimeout(() => {
          element.classList.add("animate-" + animation);
          element.classList.remove("opacity-0", "translate-y-8", "scale-95");
        }, parseInt(delay));

        // Stop observing this element
        observer.unobserve(element);
      }
    });
  }, observerOptions);

  // Observe all elements with animate-on-scroll class
  const animatedElements = document.querySelectorAll(".animate-on-scroll");
  animatedElements.forEach((element) => {
    // Set initial state
    element.classList.add("opacity-0");
    const animation = element.dataset.animation || "fade-in-up";

    if (animation.includes("fade-in-up")) {
      element.classList.add("translate-y-8");
    }
    if (animation.includes("zoom-in")) {
      element.classList.add("scale-95");
    }

    observer.observe(element);
  });
});

// Handle Turbo navigation
document.addEventListener("turbo:load", function () {
  // Re-initialize animations for Turbo navigation
  const observerOptions = {
    root: null,
    rootMargin: "0px 0px -10% 0px",
    threshold: 0.1,
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const element = entry.target;
        const animation = element.dataset.animation || "fade-in-up";
        const delay = element.dataset.delay || "0";

        setTimeout(() => {
          element.classList.add("animate-" + animation);
          element.classList.remove("opacity-0", "translate-y-8", "scale-95");
        }, parseInt(delay));

        observer.unobserve(element);
      }
    });
  }, observerOptions);

  const animatedElements = document.querySelectorAll(".animate-on-scroll");
  animatedElements.forEach((element) => {
    element.classList.add("opacity-0");
    const animation = element.dataset.animation || "fade-in-up";

    if (animation.includes("fade-in-up")) {
      element.classList.add("translate-y-8");
    }
    if (animation.includes("zoom-in")) {
      element.classList.add("scale-95");
    }

    observer.observe(element);
  });
});
