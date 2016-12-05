$(function() {
  function buildHTML(message) {
    var html = '<div class="chat__main__body__messages__message__header">'+
      '<p class="chat__main__body__messages__message__header__name">'+message.name+'</p>'+
      '<p class="chat__main__body__messages__message__header__date">'+message.time+'</p>'+'</div>'
      +'<p class="chat__main__body__messages__message__body">'+message.body+'</p>';

    $('.chat__main__body__messages').append(html);
    // return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textArea = $('#message-body');
    var message = textArea.val();
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
      $('.chat__main__body__messages').append(html);
      $("#submit").prop('disabled', false);
      textArea.val('');
    })
    .fail(function() {
      alert('入力してください');
      textArea.val('');
    });
  });
});
