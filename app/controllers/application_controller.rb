class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_order_attrs = [ :email, :name, :password, :password_confirmation, :telephone, :address]
    added_supplier_attrs = [:email, :name, :password, :password_confirmation, :telephone, :pic, :website]
    devise_parameter_sanitizer.permit :sign_up, keys: added_order_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: added_supplier_attrs
  end
end
