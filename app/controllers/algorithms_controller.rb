class AlgorithmsController < ApplicationController

  def show
    @secret = Secret.find_by(id: params[:secret_id])
    @algorithm = Algorithm.find(params[:id])
  end

  def run_code
    @secret = Secret.find_by(id: params[:secret_id])
    @algorithm = Algorithm.find_by(id: params[:algorithm_id])
    user_method = eval(URI.unescape(params[:data]))
    array_of_answers = @algorithm.caseanswers_to_array
    array_of_inputs = @algorithm.casetests_to_array

    incorrect_answers = []

    array_of_inputs.each_with_index do |inputs,idx|
      proc {
        $SAFE = 3
        begin
          method(user_method).call(inputs[0],inputs[1])
        rescue
          incorrect_answers << [inputs[0],inputs[1]]
        else
          if method(user_method).call(inputs[0],inputs[1]) != array_of_answers[idx]
            incorrect_answers << [inputs[0],inputs[1]]
          end
        end
      }.call
    end
    if incorrect_answers.empty?
      @secret.update_attributes(solved: true)
    end

    render 'algorithms/_run_code', locals: {answer: incorrect_answers}, layout: false
  end

end
