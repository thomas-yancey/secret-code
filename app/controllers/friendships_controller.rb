class FriendshipsController < ApplicationController
  def create
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
      redirect_to root_path, notice: "Successfully added friend!"
    else
      redirect_to root_path, notice: "Something went wrong."
    end
  end

  def destroy
    @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "You unfriended that guy."
    redirect_to :back
  end

  private

  def friends_params
    params.permit(:friend_id, :approved).merge(user: current_user)
  end
end
