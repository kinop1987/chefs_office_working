$(document).on('turbolinks:load', function(){
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="fileGroup">
                    <input class="imageFile text-white" type="file"
                    name="cooking[images_attributes][${num}][name]"
                    id="cooking_images_attributes_${num}_name">
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="imageGroup" >
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="imageRemove text-danger">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.fileGroup:last').data('index');
  fileIndex.splice(0, lastIndex);


  $('#imageBox').on('change', '.imageFile', function(e) {
    console.log($('.imageGroup'))
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else  {
        $('#imagePlace').append(buildImg(targetIndex, blobUrl));
         $('#imageBox').append(buildFileField(fileIndex[0]));
         fileIndex.shift();
         fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
         $(this).parent().css('display', 'none')
         $('.fileGroup:last').css('display', 'block')
         }
        if (  $('.imageGroup').length == 5){
          $('.fileGroup:last').css('display', 'none');
          }
  });

  $('#imagePlace').on('click', '.imageRemove', function() {
    const targetIndex = $(this).parent().data('index');
    console.log("おはよう")
    $(`.imageGroup[data-index="${targetIndex}"]`).remove();
    $(`.fileGroup[data-index="${targetIndex}"]`).remove();

    if ($('.imageGroup').length == 4){
      $('.fileGroup:last').css('display', 'block')
    }
    

  });

});