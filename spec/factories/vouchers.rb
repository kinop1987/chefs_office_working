FactoryBot.define do
  factory :voucher do
    delivery_date { Date.today }
    comment { 'おはよう' }
    confirm { 0 }
  end
end
