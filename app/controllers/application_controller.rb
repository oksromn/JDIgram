class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permited_parameters, if: :devise_controller?

  protected
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nickname, :firstname, :secondname, :birthday, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :firstname, :secondname, :birthday, :email, :password, :current_password, :remember_me)}
  end

end
