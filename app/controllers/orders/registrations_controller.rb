class Orders::RegistrationsController < Devise::RegistrationsController
  before_action :configure_order_permitted_parameters, if: :devise_controller?

  def edit
    @order = current_order
  end

  def update
    @order = current_order
    @order.update(order_params)
    redirect_to root_path, notice: '編集しました'
  end

  protected

  def configure_order_permitted_parameters
    added_order_attrs = %i[name telephone address]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_order_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_order_attrs)
  end

  def order_params
    params.fetch(:order, {}).permit(:name, :email, :telephone, :address, :password)
  end
end
