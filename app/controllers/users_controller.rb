class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "Successful Sign Up!"
    else
      redirect_to :back, alert: "Failed Sign Up!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
