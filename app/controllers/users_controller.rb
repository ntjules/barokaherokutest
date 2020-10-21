class UsersController < ApplicationController

  def index
    @startup = Startup.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
