import Typed from 'typed.js';

function loadDynamicBannerText() {
  if (document.getElementById("tagline")) {
    new Typed('#tagline', {
      strings: ["Book your dream vacation today", "Find the perfect apartment"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };