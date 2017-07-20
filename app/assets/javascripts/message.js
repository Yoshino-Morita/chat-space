$(function(){
  function buildHTML(message){
    var html = `<li class='chat-main__name' data-message-id="${message.id}" >
                <div class='chat-main__name'>${message.user_name}${message.created}
                <p class='chat-main__messages'>`;
    if(message.body.length === 0){
     html += `<img src= "${message.image.url}" alt="photo">`;
    }else if(message.image.url === null){
     html += `${message.body}`;
     }else{
      html += `${message.body}<img src = "${message.image.url}" alt = "photo">`;
          }
      html += `</p></li></ul>`;
      return html
      ;}
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
  })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main__contents').append(html);
      $('.chat-input').val('');
      $('.chat-main__contents').animate({scrollTop: $('.chat-main__contents')[0].scrollHeight}, 'fast');
    })
    .fail(function(){
      alert('error');
  })
    return false;
 })
  var interval = setInterval(function(){
    if(window.location.href.match(/\/groups\/\d+\/messages/)){
      $.ajax({
          type: 'GET',
          url: location.href,
          dataType: 'json'
    })
    .done(function(data){
     var id = $("li.chat-main__name:last-child").attr('data-id');
     var insertHTML = '' ;
     data.messages.forEach(function(message){
      if (message.id > id){
       insertHTML += buildHTML(message);
      }
     });
     $('.chat-main__contents').append(insertHTML);
     $('.chat-main__contents').animate({scrollTop: $('.chat-main__contents')[0].scrollHeight}, 'fast');
    })
    .fail(function(data){
      alert('自動更新に失敗しました');
    });
  }else{
    clearInterval(interval);
  }}, 5 * 1000 );
});
