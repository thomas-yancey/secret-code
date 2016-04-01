class UsersController < ApplicationController

  def index
    @users = User.all
    @message = Message.find_by(id: params[:message_id])
  end

  def show
    @user = User.find(params[:id])
  end
end
