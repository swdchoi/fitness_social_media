import consumer from "channels/consumer"

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  speak(message) {
    this.perform('speak', {message: message})
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messagecontainer = document.getElementById("messages")
    const message = document.createElement("p")
    message.innerText = data
    messagecontainer.appendChild(message)
  },

});

document.addEventListener("turbo:load", () => {
  const form = document.getElementById("chat-form");
  const input = document.getElementById("chat-input");

  form.addEventListener("submit", function(e) {
    e.preventDefault();
    const message = input.value;
    if (message.trim().length > 0) {
      chatChannel.speak(message);
      input.value = "";
    }
  });
});