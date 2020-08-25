FactoryBot.define do
  factory :supplier do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    telephone       { "000-0000-0000" }
    website         {"http://www.sample.com"}
    pic             { "サンプル太郎"}
    password        {"00000000"}
  end
end