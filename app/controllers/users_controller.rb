class UsersController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index; end

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
