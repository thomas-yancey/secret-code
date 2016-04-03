class Algorithm < ActiveRecord::Base
  require 'timeout'
  has_many :secrets
  validates :question, :method_outline, :casetests, :caseanswers, presence: true

  def self.add_error_handling(user_method)
    status = Timeout::timeout(5){
    }
  end

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

  def run_user_code(user_method)
    binding.pry
    array_of_answers = caseanswers_to_array
    array_of_inputs = casetests_to_array
    incorrect_answers = []

    array_of_inputs.each_with_index do |inputs,idx|
      begin
        binding.pry
        method(user_method).call(inputs[0],inputs[1])
        binding.pry
      rescue
        incorrect_answers << [inputs[0],inputs[1]]
      else
        if method(user_method).call(inputs[0],inputs[1]) != array_of_answers[idx]
            binding.pry
            incorrect_answers << [inputs[0],inputs[1]]
        end
      end
    end
    incorrect_answers
  end

end
