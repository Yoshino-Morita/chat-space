$(function(){
  function buildHTML(message){
    var html = `<ul class='chat-main__name'>
                <li class='chat-main__name'>${message.user_name}${message.created}
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
});
