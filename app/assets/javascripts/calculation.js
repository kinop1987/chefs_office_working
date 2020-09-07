$(function() {
  $('#calculation').on('click', function() {
    let income = parseInt($("#income").val());
    let last_invent = parseInt($("#last_invent").val());
    let this_invent = parseInt($("#this_invent").val());
    let cost = parseInt(($("#cost").val()));
    let calculation = cost + last_invent - this_invent;
    let cost_rate = calculation / income * 100;
    let r_calculation = Math.round(cost_rate * 10) / 10;

    if ($.isNumeric(income) == false)  {
      $("#income").attr('class', 'text-danger text-right w-50');
      $("#income").val("＃数値を入力してください")
    }
    if ( ($.isNumeric(last_invent) == false)){
      $("#last_invent").attr('class', 'text-danger text-right w-50');
      $("#last_invent").val("＃数値を入力してください")
    }
    if ( ($.isNumeric(this_invent) == false)){
      $("#this_invent").attr('class', 'text-danger text-right w-50');
      $("#this_invent").val("＃数値を入力してください")
    }
    if ( ($.isNumeric(cost) == false) ){
      $("#cost").attr('class', 'text-danger text-right w-50');
      $("#cost").val("＃数値を入力してください")
    }
    if ( isNaN(r_calculation)){
      $("#cost_rate").val("計算できませんでした")
    }
    else{
      $('#cost_rate').val(r_calculation);
    }
 
  });
});
