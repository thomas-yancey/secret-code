class Secret < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :message
  belongs_to :algorithm

  validates :sender, :receiver, :message, :algorithm, presence: true
end
