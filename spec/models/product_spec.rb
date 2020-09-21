require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    supplier = create(:supplier)
    @product = build(:product, supplier_id: supplier.id)
  end

  describe 'バリデーション' do
    it 'product_name, product_unitがあればOK' do
      @product.valid?
      expect(@product).to be_valid
    end

    it 'product_nameがなければNG' do
      @product.product_name = ''
      expect(@product.valid?).to eq(false)
    end

    it 'product_nameが30文字より多いとNG' do
      @product.product_name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      expect(@product.valid?).to eq(false)
    end

    it 'produt_priceが空欄でもOK' do
      @product.product_price = ''
      @product.valid?
      expect(@product).to be_valid
    end

    it 'produt_priceが整数以外だとNG' do
      @product.product_price = 'おはよう'
      @product.valid?
      expect(@product.errors[:product_price]).to include('は数値で入力してください')
    end

    it 'product_priceがマイナスの数字だとNG' do
      @product.product_price = -1000
      @product.valid?
      expect(@product.errors[:product_price]).to include('は0以上の値にしてください')
    end

    it 'product_priceがマイナスの数字だとNG' do
      @product.product_unit = ''
      @product.valid?
      expect(@product.errors[:product_unit]).to include('を入力してください')
    end

    it 'product_priceが20文字より大きいだとNG' do
      @product.product_unit = 'aaaaaaaaaaaaaaaaaaaaaa'
      @product.valid?
      expect(@product.errors[:product_unit]).to include('は20文字以内で入力してください')
    end

    it 'availabilityが空欄だとNG' do
      @product.availability = ''
      @product.valid?
      expect(@product.errors[:availability]).to include('を入力してください')
    end
  end
end
