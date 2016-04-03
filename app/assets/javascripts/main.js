$( document).ready(function(){
  $('button').on('click',function(e){
    event.preventDefault();
    var dataTransfer = editor.getValue();
    dataTransfer = allReplace(dataTransfer);
    dataPackage = {data: dataTransfer}
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: dataPackage,
      method: "GET"
    }).done(function(response){
      if (response.trim() === "false"){
        alert("Try again!");
      } else {
        $('.algorithm-container').append(response)
      }
    })
  });
  setInterval(function(){ resetIframe(); }, 300);
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

