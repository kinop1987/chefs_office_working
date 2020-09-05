$(document).on('turbolinks:load', function(){
  $("#removeTable").click(function(){
    if ($('.addForm').length == 1){
      $(".addForm").clone(true).appendTo("#addTbody");
      $(".addForm").children().children(".form-control").val(null);
      $(this).parent().remove();
    }
    else {$(this).parent().remove();}
  });

  $('#addTable').click(function(){

    $(".addForm:last").clone(true).appendTo("#addTbody");
    $(".addForm:last").children().children(".form-control").val(null);

     
  })
   
  
  

  
});