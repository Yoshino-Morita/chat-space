class GroupsController < ApplicationController
  def edit
  end

  def update
  end

  def new
    @group = Group.new
  end

  def create
  end



  #次に使用
  # private
  # def group_params
  #   params.require(:group).permit(:name)
  # end
end
