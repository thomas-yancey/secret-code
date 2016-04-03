class TemplatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find_by(id: params[:id])
    render layout: false
  end

end
