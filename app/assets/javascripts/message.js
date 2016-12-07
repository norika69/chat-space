$(function() {
  function buildHTML(message) {
    var html = '<div class="chat__main__body__messages__message__header">'+
      '<p class="chat__main__body__messages__message__header__name">'+message.name+'</p>'+
      '<p class="chat__main__body__messages__message__header__date">'+message.time+'</p>'+'</div>'
      +'<p class="chat__main__body__messages__message__body">'+message.body+'</p>';

    $('.js_message').append(html);
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var message = $('#message-body').val();
    requestUrl = document.location.pathname;
    $.ajax({
      type: 'POST',
      url: requestUrl + '/messages.json',
      data: {
        message: {
          body: message
        }
      },
      cache:false,

      dataType: 'json'
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.js_message').append(html);
      $("#submit").prop('disabled', false);
      $('#message-body').val('');
    })
    .fail(function() {
      alert('入力してください');
      $('#message-body').val('');
    });
  });
});
