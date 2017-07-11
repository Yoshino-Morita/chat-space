class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def new
    @messages = Message.new
  end

  def create
  end

end
