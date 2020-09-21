FactoryBot.define do
  factory :voucher_detail do
    product_name { 'ブリ' }
    unit_price { 780 }
    product_unit { 'kg' }
    quantity { 10 }
    delivery_date { Date.today }
  end
end
