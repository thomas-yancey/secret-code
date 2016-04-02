$( document).ready(function(){
  $('button').on('click',function(e){
    event.preventDefault();
    var dataTransfer = editor.getValue();
    dataTransfer = plusReplace(dataTransfer);
    dataTransfer = equalReplace(dataTransfer);
    dataTransfer = timesReplace(dataTransfer);
    dataTransfer = minusReplace(dataTransfer);
    // dataTransfer = divideReplace(dataTransfer);
    dataPackage = {data: dataTransfer}
    debugger
    $.ajax({
      url: event.currentTarget.children[0].getAttribute('href'),
      data: dataPackage,
      method: "GET"
    }).done(function(response){
      debugger
    })
  });
});

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

