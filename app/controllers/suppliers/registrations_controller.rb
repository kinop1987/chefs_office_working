class Suppliers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_supplier_permitted_parameters, if: :devise_controller?


  protected

  def configure_supplier_permitted_parameters
    added_supplier_attrs = [ :email, :name, :password, :password_confirmation, :telephone, :pic, :website]
    devise_parameter_sanitizer.permit :sign_up, keys: added_supplier_attrs
  end

end
