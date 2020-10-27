class UsersController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @users = User.order(:name).page(params[:page]).per(10)
    @users = User.where(email: params[:email]).page(params[:page]).per(10) if params[:email]
  end

  def show
    @message = Message.all
    @cenversation = Conversation.all
    @user = User.find(params[:id])
  end

  private

  def set_user
    @startup = Startup.all
    @users = User.all
    @users.each do |user|
      @followers = user.followers
      @following = user.following
    end
  end
end
