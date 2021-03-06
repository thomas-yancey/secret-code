class MessagesController < ApplicationController

  def new
    @message = Message.new
    @template = Template.find_by(id: params[:template_id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      if request.xhr?
        @friends = current_user.friends
        render "users/_index", locals: {user: @users, message_id: @message.id}, layout: false
      else
        @users = User.all
        redirect_to users_path
      end
    else
      flash.now[:errors]="Oops! Looks like you made a mistake!"
      redirect_to :back
    end
  end

  def show
    @message = Message.find_by(id: params[:id])
    if @message
      if  @message.secrets.first.receiver == current_user || owner?(@message)
        if @message.secrets.first.solved || owner?(@message)
        else
          flash[:notice] = "Solve the puzzle!"
          redirect_to @message.secrets.first
        end
      else
        flash[:notice] = "You can't do that!"
        redirect_to root_path
      end
    else
      flash[:notice] = "There is no message"
      redirect_to root_path
    end
  end

private

  def message_params
    params[:message][:content] = URI.unescape(params[:message][:content]).gsub(/<\/?script>/,"KIDS DAMNIT!")
    params.require(:message).permit(:content)
  end

end
