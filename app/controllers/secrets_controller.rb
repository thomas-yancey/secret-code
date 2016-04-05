class SecretsController < ApplicationController
  before_action :authenticate_user!

  def create
    secret = Secret.new(secret_params)
    if current_user.id != secret_params[:receiver_id] && secret.save
      flash[:notice] = "Your secret was sent! Shhhhhh..."
      redirect_to current_user
    else
      flash[:notice] = "Oops! Something went wrong..."
      redirect_to :back
    end
  end

  def show
    @secret = Secret.find_by(id: params[:id])
    binding.pry
    if @secret.solved
      @message = @secret.message
      redirect_to @message
    else
      redirect_to algorithm_path(id: @secret.algorithm.id, secret_id: @secret.id)
    end
  end

  private

  def secret_params
    algorithms = Algorithm.all
    algorithm = algorithms.sample
    params.permit(:receiver_id, :message_id).merge(sender: current_user, algorithm: algorithm)
  end

end
