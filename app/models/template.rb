class Template < ActiveRecord::Base
  validates :content, presence: true
end
