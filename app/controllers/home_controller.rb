class HomeController < ApplicationController
  def index 
    require 'net/http'
    require 'uri'
    require 'json'
    uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=f0c88792e99f44c2a8b81084b8bf9b39') 
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)
    @moments = moments['articles'].last(10)
  

   if order_signed_in?
      now_month = Time.now.month
      @vouchers = current_order.vouchers.where(confirm: 1)
      @yesterday_total_vouchers = @vouchers.where(delivery_date: Time.current.yesterday).sum(:total_price)
      @today_total_receipts = @vouchers.where(delivery_date: Time.current).sum(:total_price)
      @this_month_receipts = @vouchers.where('extract(month from delivery_date) = ?', now_month ).sum(:total_price)
      @receipts = current_order.vouchers.where(confirm: 0).count
   end
   
  end
end
