class MessagesController < ApplicationController

  before_action :set_group

  def index
    @message = Message.new
    @groups = current_user.groups.includes(:messages)
    @messages = @group.messages.includes(:user)
  end

  def new
  end

  def create
    @message = @group.messages.new(message_params)
   if @message.save
      redirect_to group_messages_path(@group.id), notice: 'メッセージ送信完了'
   else
    @groups = current_user.groups.includes(:messages)
    @messages = @group.messages.includes(:user)
    flash.now[:alert] = "メッセージを入力してください"
    render :index
   end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end

