
class Orders::RegistrationsController < Devise::RegistrationsController
  before_action :configure_order_permitted_parameters, if: :devise_controller?


  protected

  def configure_order_permitted_parameters
    added_order_attrs = [ :email, :name, :password, :password_confirmation, :telephone, :address]
    devise_parameter_sanitizer.permit :sign_up, keys: added_order_attrs
  end

end
