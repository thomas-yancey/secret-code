$( document).ready(function(){

  $('button').on('click',function(e){
    event.preventDefault();
    var dataTransfer = {data:encodeURIComponent(editor.getValue())};
    $('#mistakes').empty();
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: dataTransfer,
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

