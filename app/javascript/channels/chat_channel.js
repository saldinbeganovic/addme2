import consumer from "./consumer"

$(document).on('turbolinks:load', function() {
    const cht_id = document.getElementById("chat_id").className;


    consumer.subscriptions.subscriptions.forEach((subscription) => {
      if(JSON.parse(subscription.identifier).channel == 'ChatChannel')
        consumer.subscriptions.remove(subscription)
    });


  consumer.subscriptions.create({ channel: "ChatChannel", chat_id: cht_id }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("connected to "+ cht_id);
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel





        const acc_id = Number(document.getElementById("user_id").className);



        if(acc_id != data.user){
          let html = data.theirs
          const messageContainer = document.getElementById('messages');
          messageContainer.innerHTML = messageContainer.innerHTML + html;
        }




    



    }
  });

})
