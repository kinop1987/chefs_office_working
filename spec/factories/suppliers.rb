FactoryBot.define do
  factory :supplier do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    telephone       { "080-1111-11111" }
    website         {"http://www.sample.com"}
    pic             { "サンプル太郎"}
    password        {"00000000"}
    password_confirmation {"00000000"}
  end
end