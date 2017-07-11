class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
     @group = Group.new(group_params)
    if @group.save
       redirect_to root_path, notice: 'グループの編集が完了しました'
    else
      render :new
    end
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
