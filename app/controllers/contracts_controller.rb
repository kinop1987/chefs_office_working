class ContractsController < ApplicationController
  before_action :create_params_conracts , only: [:create,:confirm]

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
      .require(:contract).permit(:user_id,
                              :supplier_id,
                              :total_price,
                              :delivery_date)
  end

  def contract_details_params
    params.require(:contract_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :contract_id, :quantity, :product_name, :total_price, :order_id, :supplier_id)
    end
  end


  def create_params_order
    @contract = Contract.new(contract_params)
    @contract_details = @contract.contract_details.new(contract_details_params)
  end
end
