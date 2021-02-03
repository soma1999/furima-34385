class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'soma' && password == '1213'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_katakana, :last_name_katakana, :birthday])
  end
end
