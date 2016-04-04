class UsersController < ApplicationController

  def index
    @users = User.all
    @message = Message.find_by(id: params[:message_id])
    if @message.nil?
      flash[:notice] = "You can't do that!"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
