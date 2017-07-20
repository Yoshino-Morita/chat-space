class MessagesController < ApplicationController

  before_action :set_group, :set_groups_and_set_messages

  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = @group.messages.new(message_params)
   if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group.id) }
        format.json
       end
   else
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

  def set_groups_and_set_messages
     @groups = current_user.groups.includes(:messages)
     @messages = @group.messages.includes(:user)
  end

end

