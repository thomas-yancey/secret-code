class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to current_user
    end
  end

  def received_messages
    @user = User.find(params[:id])
  end

  def requested_friendships
    @user = User.find(params[:id])

  end


end
