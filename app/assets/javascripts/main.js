$( document).ready(function(){
  $('button').on('click',function(e){
    event.preventDefault();
    var dataTransfer = editor.getValue();
    dataTransfer = allReplace(dataTransfer);
    // dataTransfer = divideReplace(dataTransfer);
    dataPackage = {data: dataTransfer}
    debugger
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: dataPackage,
      method: "GET"
    }).done(function(response){
      if (response.trim() === "false"){
        alert("na");
      } else {
        $('.algorithm-container').append(response)
      }
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

