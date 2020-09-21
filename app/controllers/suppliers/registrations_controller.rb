class Suppliers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_supplier_permitted_parameters, if: :devise_controller?

  def edit
    @supplier = current_supplier
  end

  def update
    @supplier = current_supplier
    @supplier.update(supplier_params)
    redirect_to root_path, notice: '編集しました'
  end

  protected

  def configure_supplier_permitted_parameters
    added_supplier_attrs = %i[name telephone pic website]
    devise_parameter_sanitizer.permit :sign_up, keys: added_supplier_attrs
  end

  def supplier_params
    params.fetch(:supplier, {}).permit(:name, :email, :telephone, :website, :pic, :password)
  end
end
