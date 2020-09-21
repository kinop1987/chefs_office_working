class InventoriesController < ApplicationController
  before_action :authenticate_order!
  before_action :set_up_inventory, only: %i[edit update]
  before_action :check_collect_order, only: %i[edit update]
  before_action :search_inventories, only: %i[index search]

  def index
    @suppliers = Supplier.all
    @inventories = current_order.inventories
    @receipts = current_order.vouchers.where(confirm: 0)
    @this_month_total_price = current_order.inventories.where(inventory_month: Date.current.strftime('%Y-%m')).sum(:total_price)
    @last_month_total_price = current_order.inventories.where(inventory_month: Date.current.prev_month.strftime('%Y-%m')).sum(:total_price)
  end

  def search
    @suppliers = Supplier.all
    @results = @search.result(distinct: true).page(params[:page]).per(4)
    @this_month_total_price = @results.sum(:total_price)
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
      redirect_to inventories_path, notice: '入力完了しました'
    else
      flash.now[:alert] = '入力に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    if @inventory.update(update_inventory_params)
      redirect_to inventories_path, notice: '保存しました'
    else
      redirect_to edit_inventory_path(@inventory), alert: '保存に失敗しました'
    end
  end

  private

  def inventory_params
    params
      .require(:inventory).permit(
        :supplier_id,
        :total_price,
        :inventory_month
      ).merge(order_id: current_order.id)
  end

  def inventory_details_params
    params.require(:inventory_details).map do |param|
      ActionController::Parameters.new(param.to_unsafe_h).permit(:unit_price, :quantity, :product_name, :total_price, :order_id, :inventory_day, :product_unit)
    end
  rescue StandardError => e
    redirect_to new_inventory_path, alert: e.message and return
  end

  def set_up_inventory
    @inventory = Inventory.find(params[:id])
  end

  def update_inventory_params
    params.require(:inventory).permit(inventory_details_attributes: %i[quantity unit_price quantity product_name id])
  end

  def check_collect_order
    if @inventory.order_id != current_order.id
      flash.now[:alert] = '権限がありません'
      render root_path
    end
  end

  def search_inventories
    @search = current_order.inventories.ransack(params[:q])
    inventories = current_order.inventories.group(:inventory_month).count
    hash = {}
    inventories.each do |i|
      hash < i
    end
    @inventories = {}.merge(*hash)
  end

end
