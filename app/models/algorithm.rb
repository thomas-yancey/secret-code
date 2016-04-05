class Algorithm < ActiveRecord::Base
  require 'timeout'
  has_many :secrets
  validates :question, :method_outline, :casetests, :caseanswers, presence: true

  def self.add_error_handling(user_method)
    status = Timeout::timeout(5){
    }
  end

  def casetests_to_array
    split_on_white = self.casetests.split(" ")
    split_casetests = split_on_white.map do |params|
      casetest = params.split(",").map do |param|
        param.to_i
      end
      casetest
    end
    split_casetests
  end

  def caseanswers_to_array
    self.caseanswers.split(" ").map {|x| x.to_i }
  end

end
