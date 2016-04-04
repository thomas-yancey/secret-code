class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user, :friend, presence: true

  def self.current_friend_ids(current_user)
    Friendship.where(user_id: current_user.id, approved: true ).pluck(:friend_id)
  end

  def self.current_friend_request_ids(current_user)
    Friendship.where(user_id: current_user.id, approved: false ).pluck(:friend_id)
  end

end
