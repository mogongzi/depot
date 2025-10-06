// Entry point for the build script in your package.json
// app/javascript/application.js

// Rails UJS (for data-method, data-confirm, CSRF, etc.)
import Rails from "@rails/ujs"
Rails.start()

// Turbolinks (keep for now; later you can switch to Turbo)
import Turbolinks from "turbolinks"
Turbolinks.start()

// jQuery (if you still use it)
import $ from "jquery"
window.$ = $
window.jQuery = $

// Example: run code on page load with Turbolinks
document.addEventListener("turbolinks:load", () => {
    // your legacy init here
    // $('.flash').fadeOut(3000)
})
