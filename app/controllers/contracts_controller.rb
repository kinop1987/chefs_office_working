class ContractsController < ApplicationController
  before_action :create_params_contracts, only: [:create,:confirm]
  before_action :set_up_supplier, only: [:new,:create,:confirm]
  
  def index
    @suppliers = Supplier.all
  end

  def new
    @contract = Contract.new
    @contract.contract_details.build
    @contract_details = @contract.contract_details
  end

  def create
    if @contract.save
      redirect_to contracts_path, success: "発注を完了しました"
    else
      flash.now[:alert] = "注文に失敗しました"
      render :new
    end
  end
    

  def confirm
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def group
    @contracts = @order.contracts.where(delivery_date: params[:delivery_date])
    @count = @contracts.count
  end


  private

  def contract_params
    params
      .require(:contract).permit(:order_id,
                              :supplier_id,
                              :total_price,
                              :delivery_date,
                              :comment)
  end

  def contract_details_params
    params.require(:contract_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :quantity, :product_name, :total_price, :order_id, :supplier_id, :delivery_date, :product_unit)
    end
  rescue => e
    redirect_to action: :new   and return  

    
  end


  def create_params_contracts
    @contract = Contract.new(contract_params)
    @contract_details = @contract.contract_details.new(contract_details_params)
  end

  def set_up_supplier
    @supplier = Supplier.find(params[:supplier_id])
    @products = @supplier.products
  end

 

end
