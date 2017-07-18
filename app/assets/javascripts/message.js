$(function(){
  function buildHTML(message){
    if(message.body.length === 0){
    var html = `<ul class='chat-main__name'>
                <li class='chat-main__name'>
                ${message.user_name}
                ${message.created}
                <p class='chat-main__messages'>
                <img src="${message.image.url}" alt="photo">
                </p>
                </li>
                </ul>`
    return html;}else if(message.image.url === null){
              var html = `<ul class='chat-main__name'>
                    <li class='chat-main__name'>
                    ${message.user_name}
                    ${message.created}
                    <p class='chat-main__messages'>
                    ${message.body}
                    </p>
                    </li>
                    </ul>`
    return html;}else{
                    var html = `<ul class='chat-main__name'>
                    <li class='chat-main__name'>
                    ${message.user_name}
                    ${message.created}
                    <p class='chat-main__messages'>
                    ${message.body}
                    <img src="${message.image.url}" alt="photo">
                    </p>
                    </li>
                    </ul>`
    return html;}
  }
  $('.chat-group-form__input').on('submit', function(e){
    console.log(this);
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
 })
});