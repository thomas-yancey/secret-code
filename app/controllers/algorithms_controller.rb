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

end
