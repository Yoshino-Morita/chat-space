class UsersController < ApplicationController

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to messages_path
      # フラッシュメッセージを使用
    end
  end

  def create

  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
