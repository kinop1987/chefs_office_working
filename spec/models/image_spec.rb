require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image_path) { Rails.root.join('spec/factories/NoImage.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe 'validation test' do
    it 'it is valid with name' do
      @image = create(:image, name: [image])
      @image.valid?
      expect(@image).to be_valid
    end
  end
end
