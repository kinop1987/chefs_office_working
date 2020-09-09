$(document).on('turbolinks:load', function(){
  $(".confirm").click(function(){
    $(".quantity").each(function(index, element){
      let val = $(element).val();
      if($.isNumeric(val) == false) {
        $(element).parent().parent().remove();
      }
    })
  });

  $('#deliveryDate').change(function(){
    let date = $(this).val();
    $('.deliveryDate').val(date) 
  })


  
});