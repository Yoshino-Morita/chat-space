class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages
  end

  def new
  end

  def create
    @message = Message.create(message_params)
   if @message.save
      redirect_to action: :create
   else
    redirect_to root_path,alert: 'メッセージを入力してください'
   end
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
