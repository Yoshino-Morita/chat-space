json.messages @messages.each do |message|
  json.id          message.id
  json.user_name   message.user.name
  json.body        message.body
  json.image       message.image
  json.created     message.created_at.strftime('%Y/%m/%d %H:%M')
end
