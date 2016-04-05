class Secret < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :message
  belongs_to :algorithm

  validates :sender, :receiver, :message, :algorithm, presence: true

  def pretty_date
    self.created_at.strftime("%B %-d, %Y")
  end
end
