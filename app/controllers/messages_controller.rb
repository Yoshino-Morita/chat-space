class MessagesController < ApplicationController

  before_action :set_group

  def index
    set_message
    set_group
    @messages = @group.messages.includes(:user)
  end

  def new
  end

  def create
    set_group
    @message = @group.messages.new(message_params)
   if @message.save
      redirect_to group_messages_path(@group.id), notice: 'メッセージ送信完了'
   else
    set_message
    set_group
    @messages = @group.messages
    flash.now[:alert] = "メッセージを入力してください"
    render :index
   end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_message
    @groups = current_user.groups
    @message = Message.new
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
