class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Helpers

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  def current_cart
    current_user.cart || current_user.create_cart
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:currency])
  end
end
