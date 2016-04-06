class ApplicationController < ActionController::Base
 before_filter :configure_permitted_parameters, if: :devise_controller?
 protect_from_forgery with: :exception
 helper_method :current_user_profile?

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def current_user_profile?(a_user)
    current_user == a_user
  end

  def owner?(message)
    current_user == message.secrets.first.sender
  end

end
