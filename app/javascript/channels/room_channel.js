import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (data.for_user == "admin" )
      $("#notification_admin").html(data.content)

    else if (data.for_user == "seller" )
      $("#notification_seller").html(data.content)

    else if (data.for_user == "buyer" )
      $("#notification_buyer").html(data.content)
      
    else if (data.for_user == "all" ) 
    $("#notification_admin").html(data.content)
    $("#notification_seller").html(data.content)
    $("#notification_buyer").html(data.content)


  }
});
