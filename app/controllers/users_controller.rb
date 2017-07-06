class UsersController < ApplicationController

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
       redirect_to messages_path
    else
      # フラッシュメッセージを使用
    end
  end

  def destroy
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end

  def move_to_index
     redirect_to action: :new unless user_signed_in?
  end
end
