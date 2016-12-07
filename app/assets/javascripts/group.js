$(function() {
  function showUser(users){
    $.each(users, function(id, user) {
      var html = 
      `<div class="chat-group-user clearfix" id="group-user-div-add-${user.id}">` +
      `<p class="chat-group-user__name">${user.name}</p>` +
      `<a class="chat-group-user__btn user-search-add" id="group-user-add-${user.id}" data-user-name="${user.name}">追加</a>` +
      `</div>`;
        $('#user-search-result').append(html);
    });
  };

  function addUser(id, name) {
    var html = 
    `<div class="chat-group-user clearfix" id="group-user-${id}">` +
    `<p class="chat-group-user__name">${name}</p>` +
    `<a class="chat-group-user__btn user-search-remove" id="group-user-delete-${id}">削除</a>` +
    `<input value="${id}" type="hidden" name="group[user_ids][]">` +
    `</div>`;
      $('#chat-group-users').append(html);
  };

$(document).on('turbolinks:load', function() {
  var preWord = "";
  $('#user-search-button').on('click', function(e) {
    e.preventDefault();
    var textField = $('#user-search-field');
    var input = textField.val();

    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: {
        input:input
      },
      dataType: 'json'
    })
    .done(function(data) {
      showUser(data);
      textField.val('');

      $('.user-search-add').on('click', function() {
        var name = $(this).attr('data-user-name');
        var id = parseInt($(this).attr('id').match(/\d/g), 10);
        addUser(id,name);
        $(this).parent().remove();
      });

      $(document).on('click', '.user-search-remove', function() {
        var userId = parseInt($(this).attr('id').match(/\d/g), 10);
        var divId = "#group-user-" + userId;
        $(divId).remove();
        });
      })
      .fail(function() {
        alert('error');
      });
    });
  });
});
//   preWord = input;

// function searchUser(users) {
//   $("#user-search-result").empty();
//   $.each(users, function(i, user) {
//     addUser(user);
//   })
// }

// // 入力したユーザー表示
//   function showUser(data){
//     var html =
//     '<div class="chat-group-user">' +
//     '<p class="chat-group-user__name">'+
//     data.name +
//     '</p>' +
//     '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' +
//     data.id +
//     '" data-user-name="' +
//     data.name +
//     '">追加</a>' +
//     '</div>';
//      $("#user-search-result").append(html);
//   }

// //クリックしたユーザーの取得
//     function getUserInfo() {
//       $(".chat-group-user__btn--add").on('click', function() {
//         var id = $(this).data("user-id");
//         var name = $(this).data("user-name");
//         var user = $(this).parent();
//         user.remove();
//         addUserInfo(id,name);
//       })
//     }
// //ユーザーの追加
//   function showUserInfo(id,name) {
//     var appendedHtml =
//     '<div class="chat-group-user">'+
//     '<input name="group[user_ids][]" type="hidden"'    +
//     'value=' +
//     id+
//         '>'+
//     '<p class="chat-group-user__name">'+
//      name +
//     '</p>' +
//     '<a class="user-search-remove ' +
//     'chat-group-user__btn chat-group-user__btn--remove"' +
//     'data-user-id=' +
//      id  +
//     '>削除</a>'
//     $("#chat-group-users").append(appendedHtml);
//     }

// //ユーザー削除機能
//   $("#chat-group-users").on('click', '.chat-group-user', function() {
//     $(this).remove;
//   })
//   });
// });
