class MessagesController < ApplicationController

  def run_code
    # binding.pry
  end

  def new
    @message = Message.new
    @template = Template.find_by(id: params[:template_id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to users_path(message_id: @message.id)
    else
      flash.now[:errors]="Oops! Looks like you made a mistake!"
      redirect_to :back
    end
  end

  def show
    @message = Message.find_by(id: params[:id])
    if @message.secrets.first.receiver == current_user
      if @message.secrets.first.solved
      else
        flash[:notice] = "Solve the puzzle!"
        redirect_to @message.secrets.first
      end
    else
      flash[:notice] = "You can't do that!"
      redirect_to root_path
    end
  end



private

  def message_params
    params.require(:message).permit(:content, :template_id)
  end

end
