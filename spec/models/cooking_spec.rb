require 'rails_helper'

RSpec.describe Cooking, type: :model do
  before do
    order = create(:order)
    @cooking = build(:cooking, order_id: order.id)
  end

  describe 'validation test' do
    it 'it is valid with name, text and image' do
      @cooking.valid?
      expect(@cooking).to be_valid
    end

    it 'it is invalid without name' do
      @cooking.name = ''
      @cooking.valid?
      expect(@cooking.errors.added?(:name, :blank)).to be_truthy
    end

    it 'it is invalid if name.length over 30' do
      @cooking.name = 'a' * 31
      @cooking.valid?
      expect(@cooking.errors.of_kind?(:name, :too_long)).to be_truthy
    end

    it 'it is invalid without text' do
      @cooking.text = ''
      @cooking.valid?
      expect(@cooking.errors.of_kind?(:text, :blank)).to be_truthy
    end

    it 'it is invalid if text.length over 500' do
      @cooking.text = 'a' * 501
      @cooking.valid?
      expect(@cooking.errors.of_kind?(:text, :too_long)).to be_truthy
    end
  end
end
