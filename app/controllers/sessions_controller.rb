class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to :root, notice: "Successful Sign In!"
    else
      redirect_to new_session_path, notice: 'Failed Sign In!'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to :root
  end
end
