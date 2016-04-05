class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :received_messages, foreign_key: :receiver_id, class_name: "Secret"
  has_many :sent_messages, foreign_key: :sender_id, class_name: "Secret"

  has_many :secrets, foreign_key: :sender_id
  has_many :messages, through: :secrets

  has_many :friendships
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

  has_many :active_friends, -> {where(friendships:{approved: true})}, through: :friendships, source: :friend
  has_many :passive_friends, -> {where(friendships:{approved:true})}, through: :passive_friendships, source: :user
  has_many :pending_friends, -> {where(friendships:{approved: false})}, through: :friendships, source: :friend
  has_many :requested_friendships, -> {where(friendships:{approved: false})}, through: :passive_friendships, source: :user

  validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def friends
    active_friends | passive_friends
  end

  def not_requested
    missing = User.pluck(:id).select do |friend_id|
      User.find(friend_id) if Friendship.find_by(user_id: self.id, friend_id: friend_id) == nil
    end
    missing
  end

end
