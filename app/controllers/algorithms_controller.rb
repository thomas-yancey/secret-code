class AlgorithmsController < ApplicationController
  ENSURE_VALID_METHOD = /\s*def(.|\n)*?end\s*/

  def show
    @secret = Secret.find_by(id: params[:secret_id])
    @algorithm = Algorithm.find(params[:id])
    unless @secret.receiver == current_user
      flash[:notice] = "That's not your secret!"
      redirect_to root_path
    end
  end

  def run_code
    @secret = Secret.find_by(id: params[:secret_id])
    @algorithm = Algorithm.find_by(id:params[:algorithm_id])
    user_method = ""
    if URI.unescape(params[:data]).match(ENSURE_VALID_METHOD) == nil
      user_method = ""
    else
      user_method = eval(URI.unescape(params[:data]))
    end
    array_of_answers = @algorithm.caseanswers_to_array
    array_of_inputs = @algorithm.casetests_to_array

    incorrect_answers = []

    array_of_inputs.each_with_index do |inputs,idx|
      proc {
        $SAFE = 3
        begin
          method(user_method).call(inputs[0],inputs[1])
        rescue
          incorrect_answers << [inputs[0],inputs[1], array_of_answers[idx]]
        else
          if method(user_method).call(inputs[0],inputs[1]) != array_of_answers[idx]
            incorrect_answers << [inputs[0],inputs[1], array_of_answers[idx]]
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
