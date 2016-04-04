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
        $('.algorithm-container').append(response)
      } else {
        $('#mistakes').append("<ul>Failing test cases</ul>");
        for (e of response.trim().split("|")){
          $('#mistakes').append("<li>" + e + "</li>");
        }
      }
    })
  });

  if (document.getElementById("myframe")){
    $('body').keyup(_.debounce( resetIframe, 150))
  }

  $('#new_message').on('click', function(event){
  var that = this
  event.preventDefault();
    var dataTransfer = {message:{content: encodeURIComponent(editor.getValue()), template_id: 1}};
    $.ajax({
      url: event.currentTarget.action,
      data: dataTransfer,
      type: "POST",
    }).done(function(response){
      $('#modal-window').html(response);
      $('#modal-window').modal();
    })
  });

});


var resetIframe = function(){
  var current_editor_value = editor.getValue();
  var iframe = document.getElementById("myframe");
  iframe.contentWindow.document.open();
  iframe.contentWindow.document.write(current_editor_value);
}

