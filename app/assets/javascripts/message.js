$(function() {
  function buildHTML(message) {
     if (message.image){
    var imageUrl = message.image.image.url;
    }


  if (imageUrl != null) {
    var html = '<div class="chat__main__body__messages__message__header">'+
      '<p class="chat__main__body__messages__message__header__name">'+message.name+'</p>'+
      '<p class="chat__main__body__messages__message__header__date">'+message.time+'</p>'+'</div>'
      +'<p class="chat__main__body__messages__message__body">'+message.body+'</p>'+
      '<br /><img src="' + imageUrl + '">'+
        '</li>';
  }else{
    var html = '<div class="chat__main__body__messages__message__header">'+
      '<p class="chat__main__body__messages__message__header__name">'+message.name+'</p>'+
      '<p class="chat__main__body__messages__message__header__date">'+message.time+'</p>'+'</div>'
      +'<p class="chat__main__body__messages__message__body">'+message.body+'</p>';
    }
     $('.js_message').append(html);
  }


  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var form = $('.js-form').get()[0];
    var formData = new FormData( form );
    requestUrl = document.location.pathname;
    $.ajax({
      type: 'POST',
      url: requestUrl + '/messages.json',
      data: formData,
          processData: false,
          contentType: false,
          dataType: 'json',
          cache:false
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.js_message').append(html);
      $("#submit").prop('disabled', false);
      $('#message-body').val('');
      $('.icon-photo').val('');

    })
    .fail(function() {
      alert('入力してください');
      $('#message-body').val('');
    });
  });
});
