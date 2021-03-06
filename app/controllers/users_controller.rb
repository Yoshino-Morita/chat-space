class UsersController < ApplicationController

  def index
    @users = User.name_search(current_user, params[:keyword])
    respond_to do |format|
      format.json
    end
  end

  def create
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
