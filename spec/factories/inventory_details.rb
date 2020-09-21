FactoryBot.define do
  factory :inventory_detail do
    product_name { 'ブリ' }
    unit_price { '780' }
    quantity { '5' }
    product_unit { 'kg' }
    inventory_day { Date.current }
  end
end
