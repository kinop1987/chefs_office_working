require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = build(:order)
  end

  describe 'バリデーション' do
    it 'name, email, telephone, address, password, password_confirmationがあればOK' do
      expect(@order.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @order.name = ''
      expect(@order.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @order.email = ''
      expect(@order.valid?).to eq(false)
    end

    it 'telephoneが空だとNG' do
      @order.telephone = ''
      expect(@order.valid?).to eq(false)
    end

    it 'addressが空だとNG' do
      @order.address = ''
      expect(@order.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @order.password = ''
      expect(@order.valid?).to eq(false)
    end
  end
end
