json.user_id         @message.user.id
json.user_name       @message.user.name

json.group_id        @message.group.id
json.group_name      @message.group.name

json.body    @message.body
json.image   @message.image
json.created @message.created_at.strftime('%Y/%m/%d %H:%M')
