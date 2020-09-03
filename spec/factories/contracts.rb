FactoryBot.define do
  factory :contract do
    delivery_date { Date.today }
    comment { "おはようございます" }
  end
end
