class Algorithm < ActiveRecord::Base
  has_many :secrets

  def self.convert_pluses(str)
    str.gsub!("™", "+")
    return str
  end

end
