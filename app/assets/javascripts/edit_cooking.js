$(document).on('turbolinks:load', function(){
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="fileGroupEdit" style="display: none;">
                    <input class="imageFileEdit text-white" type="file"
                    name="cooking[images_attributes][${num}][name]"
                    id="cooking_images_attributes_${num}_name">
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="imageGroupEdit mr-2" >
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="editRemove text-danger">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.fileGroupEdit:last').data('index');
  fileIndex.splice(0, lastIndex);


  $('#imageBoxEdit').on('change', '.imageFileEdit', function(e) {
    console.log($('.imageGroupEdit'))
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else  {
        $('#imagePlaceEdit').append(buildImg(targetIndex, blobUrl));
         $('#imageBoxEdit').append(buildFileField(fileIndex[0]));
         fileIndex.shift();
         fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
         $(this).parent().css('display', 'none')
         $('.fileGroupEdit:last').css('display', 'block')
         }
        if (  $('.imageGroupEdit').length == 5){
          $('.fileGroupEdit:last').css('display', 'none');
          }
  });

  $('#imagePlaceEdit').on('click', '.editRemove', function() {
    let editNumber = Number($(this).parent().data('index'));
    const targetIndex = $(this).parent().data('index');
    const editHiddenCheck = $(`input[data-index="${editNumber}"].hidden-destroy`);
    if (editHiddenCheck) editHiddenCheck.prop('checked', true)
    $(`.imageGroupEdit[data-index="${targetIndex}"]`).remove();
    $(`.fileGroupEdit[data-index="${targetIndex}"]`).remove();

    if ($('.imageGroupEdit').length == 4){
      $('.fileGroupEdit:last').css('display', 'block')
    }
    

  });

  $('.editImageBtn').on('click', function(){
    if ($('.imageGroupEdit').length == 5){
      $('#imageBoxEdit').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      $(this).remove();
    }
    else{
      const  inputNumber = $('.hidden-destroy').length
      $('#imageBoxEdit').append(buildFileField(inputNumber));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      $(this).remove();
    
      $(`.fileGroupEdit[data-index="${inputNumber}"]`).filter(
        function() {
            return this !== $(`.fileGroupEdit[data-index="${inputNumber}"`).get(0);
        }
      ).remove();
      $('.fileGroupEdit:last').css('display', 'block')
    }
  });

});


  