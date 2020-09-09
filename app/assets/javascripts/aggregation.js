$(document).on('turbolinks:load', function(){
  $(".dailySum").each(function(index, element){
    let str = $(element).text();
    if(str == 0) {
      $(element).text("");
    }
  })



  
});