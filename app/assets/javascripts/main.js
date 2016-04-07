$( document).ready(function(){

  $('button').on('click',function(e){
    event.preventDefault();
    $('#mistakes').empty();
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: {data:encodeURIComponent(editor.getValue())},
      method: "GET"
    }).done(function(response){
      if (response.match("Your message!")){
        $('.algorithm-container').html(response);
      } else {
        $('#mistakes').append("<ul>Failing test cases</ul>");
        response.trim().split("|").forEach(function(e){
          $('#mistakes').append("<li>" + e + "</li>");
        });
      }
    })
  });

  if ($(".friend-requests").length > 0){
    setInterval(function(){
    $.ajax({
      method: "GET",
      url: window.location.href + '/received_messages'
    }).done(function(response){
      if($('.received-messages').html().trim() != response.trim()){
        $('.received-messages').html(response);
        $('.received-messages-button').text("New Message!").css("color", "red")

        }
      });
    }, 5000);

    setInterval(function(){
    $.ajax({
      method: "GET",
      url: window.location.href + '/requested_friendships'
    }).done(function(response){
      if($('.friend-requests').html().trim() != response.trim()){
        $('.friend-requests').html(response);
        }
      });
    }, 5000);
  }

  if (document.getElementById("myframe")){
    $('body').keyup(_.debounce( resetIframe, 150))
  }

  $('#new_message').on('click', function(event){
  event.preventDefault();
    var subbed_content = editor.getValue().replace(/<\/?script>/g,"CHILDRENS SITE!")
    var content = encodeURIComponent(subbed_content)
    var dataTransfer = {message:{content: content, template_id: 1}};
    $.ajax({
      url: event.currentTarget.action,
      data: dataTransfer,
      type: "POST",
    }).done(function(response){
      $('#modal-window').html(response);
      $('#modal-window').modal();
    })
  });

  $(".friends-list").on("submit", ".new_friendship", function(event){
    event.preventDefault();
    var that = this
    $.ajax({
      method: "POST",
      url: event.currentTarget.action,
      data: $(this).serialize()
    }).done(function(response){
      $(".potential-friends").append(response);
      $(that).parent().parent().remove();
    })
  })

  $('.received-messages-button').on('click', function(event){
      $('<div id="dialog-form">Received Messages</div>').dialog({
        autoOpen: true,
        width: 520,
        modal: true,
        open: function() {
            $('.received-messages').clone().appendTo($(this)).show();
            $('.ui-dialog :button').blur();
        },
        close: function() {
          $('.ui-dialog').remove()
        }
    });
  })

    $('.sent-messages-button').on('click', function(event){
      $('<div id="dialog-form">Sent Messages</div>').dialog({
        autoOpen: true,
        width: 520,
        modal: true,
        open: function() {
            $('.sent-messages').clone().appendTo($(this)).show();
            $('.ui-dialog :button').blur();
        },
        close: function() {
          $('.ui-dialog').remove()
        }
    });
  })

});

var resetIframe = function(){
  var current_editor_value = editor.getValue();
  var iframe = document.getElementById("myframe");
  iframe.contentWindow.document.open();
  iframe.contentWindow.document.write(current_editor_value);
}

