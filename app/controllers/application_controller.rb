class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_parmitted_parameters, if: :devise_controller?

  def configure_paramitted_parameters
    devise_parameter_sanitizer.parmit(:sign_up, keys: [:name])
  end
end
