FactoryBot.define do
  factory :inventory do
      inventory_month { "#{Date.current.strftime('%Y-%m')}"}
    end
  
  
end
