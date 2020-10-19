class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'uri'
    require 'json'
    uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=f0c88792e99f44c2a8b81084b8bf9b39')
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)

    if order_signed_in?
      now_month = Time.now.month
      @vouchers = current_order.vouchers.where(confirm: 1)
      @yesterday_total_vouchers = @vouchers.where(delivery_date: Date.current.yesterday).sum(:total_price)
      @today_total_receipts = @vouchers.where(delivery_date: Date.current).sum(:total_price)
      @this_month_receipts = @vouchers.where('extract(month from delivery_date) = ?', now_month).sum(:total_price)
      @receipts = current_order.vouchers.where(confirm: 0).count
      @moments = moments['articles'].last(20)
    end

    if supplier_signed_in?
      now_month = Time.now.month
      @vouchers = current_supplier.vouchers.where(confirm: 1)
      @yesterday_total_vouchers = @vouchers.where(delivery_date: Date.current.yesterday).sum(:total_price)
      @today_total_receipts = @vouchers.where(delivery_date: Date.current).sum(:total_price)
      @this_month_receipts = @vouchers.where('extract(month from delivery_date) = ?', now_month).sum(:total_price)
      @contracts = current_supplier.contracts.where(confirm: 0).count
      @moments = moments['articles'].last(20)
    end
  end

  def calculation
    now_month = Time.now.month
    @total_vouchers = current_order.vouchers.where(confirm: 1)
    @this_month_receipts = @total_vouchers.where('extract(month from delivery_date) = ?', now_month).sum(:total_price)
    @this_month_inventory = current_order.inventories.where(inventory_month: Date.current.strftime('%Y-%m')).sum(:total_price)
    @last_month_inventory = current_order.inventories.where(inventory_month: Date.current.prev_month.strftime('%Y-%m')).sum(:total_price)
  end

  def calendar
    @contracts = current_order.contracts
    @vouchers = current_order.vouchers
  end

  def suppliers
    @suppliers = Supplier.all
  end

  def orders
    @orders = Order.all
  end
end
