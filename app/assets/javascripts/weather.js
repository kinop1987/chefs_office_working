$(document).on('turbolinks:load', function() {

  function buildHTML(data, i) {
    let Week = new Array("（日）","（月）","（火）","（水）","（木）","（金）","（土）");
    let date = new Date (data.list[i].dt_txt);
    date.setHours(date.getHours() + 9);
    let month = date.getMonth()+1;
    let day = month + "月" + date.getDate() + "日" + Week[date.getDay()] ;
    let icon = data.list[i].weather[0].icon;
    let html =
    '<div class="weather-report">' +
      '<img src="http://openweathermap.org/img/w/' + icon + '.png">' +
      '<div class="weather-date">' + day + '</div>' +
      '<div class="weather-temp-max text-danger">' + '最高：' + Math.round(data.list[i].main.temp_max) + "℃</div>" +
      '<span class="weather-temp-min text-primary">' + '最低：' + Math.floor(data.list[i].main.temp_min) + "℃</span>" +
    '</div>';
    return html
  }

  let API_KEY = 'e6bc9cf9236873da84e388bbc368a2e2'
  let city = 'Tokyo';
  let url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })

  .done(function(data) {
    let insertHTML = "";
    for (let i = 0; i <= 32; i = i + 8) {
      insertHTML += buildHTML(data, i);
    }
    $('#weather').html(insertHTML);
  })
  .fail(function(data) {

      alert("失敗しました");
  });

  
});