$( document).ready(function(){
  $('button').on('click',function(e){
    event.preventDefault();
    var dataTransfer = editor.getValue();
    $('#mistakes').empty();
    dataTransfer = allReplace(dataTransfer);
    dataPackage = {data: dataTransfer}
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: dataPackage,
      method: "GET"
    }).done(function(response){
      if (response.trim() === "true"){
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
  console.log("blocked");
  var that = this
  event.preventDefault();
    var dataTransfer = editor.getValue();
    dataTransfer = allReplace(dataTransfer);
    dataPackage = {message:{content: dataTransfer, template_id: 1}};
    $.ajax({
      url: event.currentTarget.action,
      data: dataPackage,
      type: "POST",
    }).done(function(response){
      console.log(that);
      $(that).toggle();
      $('body').append(response);

    })
  });
});


var allReplace = function(str){
  str = plusReplace(str);
  str = minusReplace(str);
  str = equalReplace(str);
  str = timesReplace(str);
  return str
}

var resetIframe = function(){
  var current_editor_value = editor.getValue();
  var iframe = document.getElementById("myframe");
  iframe.contentWindow.document.open();
  iframe.contentWindow.document.write(current_editor_value);
}

var plusReplace = function(str){
  return str.replace(/\+/g,"™");
}

var minusReplace = function(str){
  return str.replace(/\-/g,"¡");
}

var equalReplace = function(str){
  return str.replace(/\=/g,"£");
}

var timesReplace = function(str){
  return str.replace(/\*/g,"•");
}
var getContent = function(){
  return editor.getValue();
}

