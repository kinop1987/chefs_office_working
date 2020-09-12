FactoryBot.define do
  factory :cooking do
    name { "ブリのあら煮"}
    text {"ブリのあらを適当な大きさにカットしましょう" }    
    after(:build) do |cooking|
      cooking.images << build(:image, cooking: cooking)
    end  
  end

  factory :image do
    name {  Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/NoImage.jpg'), 'spec/factories/NoImage.jpg')  } 
  end


end
