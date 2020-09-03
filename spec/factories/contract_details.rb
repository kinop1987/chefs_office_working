FactoryBot.define do
  factory :contract_detail do
    product_name { "ブリ" }
    unit_price {10000 }
    product_unit {"kg"}
    quantity { 10 } 
    delivery_date { Date.today }
  end
end
