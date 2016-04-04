class FriendshipsController < ApplicationController
  def create
    # create button that creates new friend request in friendships index
    @friendship = current_user.friendships.build(friends_params)
    if @friendship.save
      flash[:notice] = "Friend request sent!"
      redirect_to :back
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
    flash[:notice] = "You unfriended that guy."
    redirect_to :back
  end

  def index
    binding.pry
    curr_friend_ids = Friendship.current_friend_ids(current_user)
    curr_friend_request_ids = Friendship.current_friend_request_ids(current_user)
    @curr_friends = User.where(id: curr_friend_ids)
    @curr_friend_requests = User.where(id: curr_friend_request_ids)
    @not_yet_requested = User.where.not(id: curr_friend_ids + curr_friend_request_ids )
    @friendship = Friendship.new
  end

  private

  def friends_params
    params.require(:friendship).permit(:friend_id, :approved).merge(user: current_user)
  end
end
