class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :received_messages, foreign_key: :receiver_id, class_name: "Secret"
  has_many :sent_messages, foreign_key: :sender_id, class_name: "Secret"

  validates :username, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        
end
