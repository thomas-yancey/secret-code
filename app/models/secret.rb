class Secret < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :message
  belongs_to :algorithm

  validates :sender, :receiver, :message, :algorithm, presence: true
  validate :cannot_send_messages_to_yourself

  def pretty_date
    self.created_at.strftime("%B %-d, %Y")
  end

private
  def cannot_send_messages_to_yourself
    if sender == receiver
      errors.add(:receiver, "can't be yourself you ninny")
    end
  end
end
