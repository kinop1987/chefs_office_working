$(document).on('turbolinks:load', function() {
  const speech = new webkitSpeechRecognition();
  speech.lang = 'ja-JP';

  const content = document.getElementById('speechContent');
  $('#startSpeech').click(function(){
        console.log(content)
      speech.start();
  })

  speech.onresult = function(e) {
       speech.stop();
       if(e.results[0].isFinal){
           let autotext =  e.results[0][0].transcript
           content.value += autotext + '\n';
        }
   }

   speech.onend = () => { 
      speech.start() 
   };


  });

