class Message < ActiveRecord::Base
  has_many :secrets, foreign_key: :message_id
  has_many :users, through: :secrets, source: :sender
  belongs_to :template

  validates :template, :content, :secret_key, presence: true

end
