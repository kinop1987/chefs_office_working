class VouchersController < ApplicationController
  before_action :create_params_vouchers, only: [:create,:confirm]
  before_action :set_up_order, only: [:new,:create,:confirm]
  before_action :set_up_supplier, only: [:index, :new, :create, :show, :confirm, :group]

  def index
    @suppliers = Supplier.all
  end

  def new
    @voucher = Voucher.new
    @voucher.voucher_details.build
    @voucher_details = @voucher.voucher_details
  end

  def create
    if @voucher.save
      redirect_to supplier_vouchers_path(@supplier), success: "伝票を作成しました"
    else
      flash.now[:alert] = "伝票作成に失敗しました"
      render "/supplier/#{@supplier.id}/vouchers/#{@order.id}/new"
    end
  end
    

  def confirm
    
  end

  def show
    @voucher = Voucher.find(params[:id])
  end

  def group
    @vouchers = @suppler.vouchers.where(delivery_date: params[:delivery_date])
    @count = @vouchers.count
  end


  private

  def voucher_params
    params
      .require(:voucher).permit(:order_id,
                              :supplier_id,
                              :total_price,
                              :delivery_date,
                              :comment,
                              :confirm)
  end

  def voucher_details_params
    params.require(:voucher_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :quantity, :product_name, :total_price, :order_id, :supplier_id, :delivery_date, :product_unit)
    end
  end


  def create_params_vouchers
    @voucher = Contract.new(contract_params)
    @voucher_details = @voucher.voucher_details.new(voucher_details_params)
  end

  def set_up_order
    @order = Order.find(params[:order_id])
    @contrcts = @order.contracts
  end

  def set_up_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end
end
