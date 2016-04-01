class Template < ActiveRecord::Base
  has_many :messages
  validates :content, presence: true
end
