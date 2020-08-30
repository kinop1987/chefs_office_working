FactoryBot.define do
  factory :order do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    telephone       { "080-0230-0030" }
    address         {"東京都千代田区１−１−１"}
    password        {"00000000"}
    password_confirmation {"00000000"}
  end
end