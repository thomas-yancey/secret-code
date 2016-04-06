class Message < ActiveRecord::Base
  has_many :secrets, foreign_key: :message_id
  has_many :users, through: :secrets, source: :sender

  validates :content, presence: true

end
