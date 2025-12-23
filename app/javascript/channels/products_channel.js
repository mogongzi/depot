import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    console.log("Connected to ProductsChannel")
  },

  disconnected() {
    console.log("Disconnected from ProductsChannel")
  },

  received(data) {
    const mainElement = document.querySelector(".store #main")
    if (mainElement) {
      mainElement.innerHTML = data.html
    }

    const entryElement = document.querySelector(`div#${data.id}.entry`)
    if (entryElement) {
      entryElement.style.backgroundColor = "#88ff88"
      // Fade back to white using CSS transition
      setTimeout(() => {
        entryElement.style.transition = "background-color 1s"
        entryElement.style.backgroundColor = "white"
      }, 100)
    }
  }
})
