class GroupsController < ApplicationController
  def edit
  end

  def update
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
       redirect_to root_path, notice: 'グループの作成が完了しました'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
