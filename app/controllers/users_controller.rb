class UsersController < ApplicationController
  def edit
    @user = User.all
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end

end
