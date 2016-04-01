class MessagesController < ApplicationController

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

private

  def message_params
    params.require(:message).permit(:content, :template_id)
  end
end
