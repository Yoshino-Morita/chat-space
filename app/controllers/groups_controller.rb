class GroupsController < ApplicationController
  def edit
  end

  def update
  end

  def new
    @group = Group.new
  end

  def create
      redirect_to messages_path
  end

  # private
  # def group_params
  #   params.require(:group).permit(:id,:name)
  # end
end
