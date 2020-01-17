App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $(".store #main").html(data.html)
    $("div#" + data.id + ".entry").css({ backgroundColor: "#88ff88" }).animate({backgroundColor: "white"}, 1000);
    # Called when there's incoming data on the websocket for this channel
