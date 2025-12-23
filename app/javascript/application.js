// Entry point for the build script in your package.json
// app/javascript/application.js

// Turbo (replaces Turbolinks and @rails/ujs)
import "@hotwired/turbo-rails"

// Stimulus
import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.debug = false
window.Stimulus = application

// Import Action Cable channel
import "./channels/products_channel"
