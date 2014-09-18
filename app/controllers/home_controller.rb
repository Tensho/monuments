class HomeController < ApplicationController
  def index
    if current_user
      @collections = current_user.collections
    else
      @users = User.all
    end
  end
end
