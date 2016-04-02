class Algorithm < ActiveRecord::Base
  has_many :secrets

  def self.convert_operators(str)
    str.gsub!("™", "+")
    str.gsub!("¡", "-")
    str.gsub!("£", "=")
    str.gsub!("•", "*")
    return str
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
