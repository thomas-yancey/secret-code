class AlgorithmsController < ApplicationController

  def update
    answer = params[:algorithm][:answer]
    algorithm = Algorithm.find_by(id: params[:id])
    if algorithm.answer == answer
      flash[:notice] = "Good work! Here's your message..."
      secret = Secret.find_by(id: params[:algorithm][:secret_id])
      secret.solved = true
      secret.save
      redirect_to secret.message
    else
      flash[:notice] = "That was incorrect!"
      redirect_to :back
    end
  end

  def show
    @algorithm = Algorithm.find(1)
  end

  def create
    redirect_to :back
  end

  def index
    redirect_to :back
  end

  def run_code

    Algorithm.convert_pluses(params[:data])
    user_method = eval(params[:data])
    array_of_answers = [2,7,11]
    array_of_inputs = [[1,1],[3,4],[5,6]]
    array_of_inputs.each_with_index do |inputs,idx|
      # if the user method does not happen change the false to be some error message
      return false if user_method(inputs[0],inputs[1]) != array_of_answers[idx]
    end
    # redirect to message or send back option to view message after you answer correctly
  end
end
