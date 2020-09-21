FactoryBot.define do
  factory :inventory do
    inventory_month { Date.current.strftime('%Y-%m').to_s }
  end
end
