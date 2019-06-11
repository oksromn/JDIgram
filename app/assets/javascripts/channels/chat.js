App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log("Connected to the chat channel")
  },
  disconnected: function() {
    console.log("Disconnected from the channel")
  },
  received: function(data) {
    var messages = $('#chatbox');
    messages.prepend(data['message']);
  },

});
