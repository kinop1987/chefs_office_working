class InventoriesController < ApplicationController

  def index
    @receipts = current_order.vouchers.where(confirm: 0)
    @inventories = current_order.inventories
    @this_month_total_price = current_order.inventories.where(inventory_month: Date.current).sum(:total_price)
    @last_month_total_price = current_order.inventories.where(inventory_month: Date.current.prev_month).sum(:total_price)
    @search = current_order.inventories.ransack(params[:q])
    @results = @search.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    aggregation = VoucherDetail.group(:product_name, :product_unit).where(supplier_id: params[:id]).average(:unit_price)
    @average = []
    aggregation.each do |a|
      @average << a
    end
    @inventory = Inventory.new
    @inventory.inventory_details.build
    @inventory_details = @inventory.inventory_details
    @supplier = Supplier.find(params[:id])
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory_details = @inventory.inventory_details.new(inventory_details_params)
    if @inventory.save
      redirect_to inventories_path, notice: "入力完了しました"
    else
      flash.now[:alert] = "入力に失敗しました"
      render :new
    end
  end

  private

  def inventory_params
    params
      .require(:inventory).permit(
                              :supplier_id,
                              :total_price,
                              :inventory_month,
                              ).merge(order_id: current_order.id)
  end

  def inventory_details_params
    params.require(:inventory_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :quantity, :product_name, :total_price, :order_id, :inventory_day, :product_unit)
    end
  rescue => e
    redirect_to new_inventory_path, alert: "入力内容が正しくありません" and return 
  end


end
