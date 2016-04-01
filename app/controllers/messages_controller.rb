class MessagesController < ApplicationController

def new
  @message = Message.new
  @template = Template.find_by(id: params[:template_id])
end

end
