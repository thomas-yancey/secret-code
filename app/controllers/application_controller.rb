class ApplicationController < ActionController::Base
 before_filter :configure_permitted_parameters, if: :devise_controller?
 protect_from_forgery with: :exception
 before_action :authenticate_user!

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def owner?(message)
    current_user == message.secrets.first.sender
  end

end
