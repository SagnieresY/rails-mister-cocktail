// app/javascript/components/banner.js
import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["I want a Kiwi Bang", "I want a Mojito", "I want to be amazed!", "I want to amaze my friends"],
    smartBackspace: true, // Default value
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
