class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    curr_friend_ids = Friendship.current_friend_ids(current_user)
    curr_friend_request_ids = Friendship.current_friend_request_ids(current_user)
    @curr_friends = User.where(id: curr_friend_ids)
    @curr_friend_requests = User.where(id: curr_friend_request_ids)
    @not_yet_requested = User.where.not(id: curr_friend_ids + curr_friend_request_ids )
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friends_params)
    if friends_params[:user].id != friends_params[:friend_id] && @friendship.save
      if request.xhr?
      curr_friend_ids = Friendship.current_friend_ids(current_user)
      curr_friend_request_ids = Friendship.current_friend_request_ids(current_user)
      @curr_friends = User.where(id: curr_friend_ids)
      @curr_friend_requests = User.where(id: curr_friend_request_ids)
      @not_yet_requested = User.where.not(id: curr_friend_ids + curr_friend_request_ids )
      @friendship = Friendship.new
      render "friendships/index", locals: {pending: @curr_friend_requests, user: @not_yet_requested}, layout: false
    else
      flash[:notice] ="Friend request sent!"
      redirect_to :back
    end
    else
      flash[:notice] = "Unable to send friend request."
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(approved: true)
    if @friendship.save
      redirect_to :back, notice: "Successfully added friend!"
    else
      redirect_to :back, notice: "Something went wrong."
    end
  end

  def destroy
    @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "You have removed that friend."
    redirect_to :back
  end

  private

  def friends_params
    params.require(:friendship).permit(:friend_id, :approved).merge(user: current_user)
  end
end
