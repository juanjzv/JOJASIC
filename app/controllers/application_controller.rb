class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Just redirect to root_path when a user reachs a not authorized path
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    puts 'configurar parametros'
  end

  def user_not_authorized
    flash[:alert] = "Acceso Denegado"
    redirect_to (request.referrer || root_path)
  end

end
