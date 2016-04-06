class Template < ActiveRecord::Base
  validates :title, :preview_url, :content, presence: true
end
