$(document).on('turbolinks:load', function() {
  const speech = new webkitSpeechRecognition();
  speech.lang = 'ja-JP';

  const btn = $('#startSpeech');
  const content = $('#speechContent');
  btn.click(function(){
        console.log(speech)
      speech.start();
  })

  speech.onresult = function(e) {
       speech.stop();
       if(e.results[0].isFinal){
           const autotext =  e.results[0][0].transcript
           content.value += autotext + '\n';
        }
   }

   speech.onend = () => { 
      speech.start() 
   };


  });

 