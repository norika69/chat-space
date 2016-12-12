$(function() {
  function buildHTML(message) {

  if (message.image){
    var imageUrl = message.image.image.url;
    }

  if (imageUrl != null) {
    var html =  '<li>'+
                '<div class="chat__main__body__messages__message__header">'+
                '<p class="chat__main__body__messages__message__header__name">'+
                message.name+
                '</p>'+
                '<p class="chat__main__body__messages__message__header__date">'+
                message.time+
                '</p>'+
                '</div>'+
                '<p class="chat__main__body__messages__message__body">'+
                message.body+
                '</p>'+
                '<br /><img src="' + imageUrl + '">'+
                '</li>';
  }else{
    var html =  '<li>'+
                '<div class="chat__main__body__messages__message__header">'+
                '<p class="chat__main__body__messages__message__header__name">'+
                message.name+'</p>'+
                '<p class="chat__main__body__messages__message__header__date">'+
                message.time+'</p>'+
                '</div>'+
                '<p class="chat__main__body__messages__message__body">'+
                message.body+
                '</p>';
    }
     $('.js_message').append(html);
  }

  function scroll() {
    $(".chat__main__body").scrollTop( $(".chat__main__body")[0].scrollHeight );
  }

  setInterval(autoUpdate, 2000);

  function autoUpdate(){
    url = document.location.pathname;
    if( url.match(/groups/) ){
      $.ajax({
        type: 'GET',
        url: url,
        dataType: 'json'
      })
      .done(function(data){
        var length = $('li').length;
        if(length != data.number){
          buildHTML(data);
          scroll();
        }
      })
      .fail(function(){
         alert('err');
      });
    }
  }



  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var form = $(this).get()[0];
    var formData = new FormData( form );
    requestUrl = document.location.pathname;
    $.ajax({
      type: 'POST',
      url: requestUrl + '/messages.json',
      data: formData,
      cache:false,
      processData: false,
      contentType: false,
      dataType: 'json'
    })

    .done(function(data) {
      var html = buildHTML(data);
      $("#submit").prop('disabled', false);
      $('#message-body').val('');
      $('#message-image').val('');
       scroll();
    })
    .fail(function() {
      alert('入力してください');
      $('#message-body').val('');
    });
  });
});
