class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def received_messages
    @user = User.find(params[:id])
  end

  def requested_friendships
    @user = User.find(params[:id])

  end


end
