class HomeController < ApplicationController
  def index
    if current_user
      @collections = current_user.collections
      @categories = current_user.categories
    else
      @users = User.all
    end
  end
end
