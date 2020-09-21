class VouchersController < ApplicationController
  before_action :create_params_vouchers, only: %i[create confirm]
  before_action :set_up_contract, only: %i[new create confirm]
  before_action :search_vouchers, only: %i[orders_voucher search]

  def orders_voucher
    @vouchers = current_order.vouchers.where(confirm: 1).order('delivery_date DESC').page(params[:page]).per(4)
  end

  def search
    @results = @search.result(distinct: true).order('delivery_date DESC').page(params[:page]).per(4)
  end

  def suppliers_voucher
    @vouchers = current_supplier.vouchers.where(confirm: 1).order('delivery_date DESC').page(params[:page]).per(4)
  end

  def receipt
    @vouchers = current_order.vouchers.where(confirm: 0).order('delivery_date DESC').page(params[:page]).per(4)
  end

  def new
    @voucher = Voucher.new
    @voucher.voucher_details.build
    @voucher_details = @voucher.voucher_details
  end

  def create
    if @voucher.save
      @contract.update(confirm: 1)
      redirect_to check_contract_path, success: '伝票を作成しました'
    else
      flash.now[:alert] = '伝票作成に失敗しました'
      render :new
    end
  end

  def show
    @voucher = Voucher.find(params[:voucher_id])
  end

  def update
    @voucher = Voucher.find(params[:voucher_id])
    @voucher.update(confirm: 1)
    redirect_to receipt_voucher_path, success: '伝票を受領しました'
  end

  def confirm; end

  def group
    @vouchers = current_order.vouchers.where(delivery_date: params[:delivery_date]).page(params[:page]).per(4)
    @total_price = @vouchers.sum(:total_price)
  end

  def aggregation
    start_date = Date.current.beginning_of_month
    end_date = Date.current.end_of_month
    month = (start_date..end_date)
    page = []
    month.each do |date|
      page << date
    end
    @date = Kaminari.paginate_array(page).page(params[:page]).per(7)

    @total_price = current_order.vouchers.where(delivery_date: start_date..end_date).sum(:total_price)
    @daily_sum = current_order.vouchers
    @suppliers = Supplier.all
  end

  private

  def voucher_params
    params
      .require(:voucher).permit(:order_id,
                                :supplier_id,
                                :total_price,
                                :delivery_date,
                                :comment).merge(confirm: 0)
  end

  def voucher_details_params
    params.require(:voucher_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :quantity, :product_name, :total_price, :order_id, :supplier_id, :delivery_date, :product_unit)
    end
  rescue StandardError => e
    redirect_to new_voucher_path, alert: e.message and return
  end

  def create_params_vouchers
    @voucher = Voucher.new(voucher_params)
    @voucher_details = @voucher.voucher_details.new(voucher_details_params)
  end

  def set_up_contract
    @contract = Contract.find(params[:contract_id])
    @contract_details = @contract.contract_details
  end

  def search_vouchers
    @search = current_order.vouchers.where(confirm: 1).ransack(params[:q])
    @suppliers = Supplier.all
  end
end
