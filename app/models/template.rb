class Template < ActiveRecord::Base
  has_many :messages
  validates :title, :preview_url, :content, presence: true
end
