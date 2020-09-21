require 'rails_helper'

RSpec.describe VoucherDetail, type: :model do
  before do
    supplier = create(:supplier)
    order = create(:order)
    voucher = create(:voucher, order_id: order.id, supplier_id: supplier.id)
    @voucher_detail = build(:voucher_detail, supplier_id: supplier.id, order_id: order.id, voucher_id: voucher.id)
  end

  describe 'バリデーション' do
    it 'delivery_date,  product_name, unit_price, product_unitがあればOK' do
      @voucher_detail.valid?
      expect(@voucher_detail).to be_valid
    end

    it 'delivery_dateがないとNG' do
      @voucher_detail.delivery_date = ''
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:delivery_date]).to include('を入力してください')
    end

    it 'delivery_dateが昨日以降だとNG' do
      @voucher_detail.delivery_date = Date.yesterday
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:delivery_date]).to include('は不正な値です')
    end

    it 'total_priceはなくてもOK' do
      @voucher_detail.total_price = ''
      @voucher_detail.valid?
      expect(@voucher_detail).to be_valid
    end

    it 'produt_nameがないとNG' do
      @voucher_detail.product_name = ''
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:product_name]).to include('を入力してください')
    end

    it 'unit_priceがないとNG' do
      @voucher_detail.unit_price = ''
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:unit_price]).to include('を入力してください')
    end

    it 'unit_priceが数字以外だとNG' do
      @voucher_detail.unit_price = 'おはよう'
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:unit_price]).to include('は数値で入力してください')
    end

    it 'unit_priceがマイナスの数字だとNG' do
      @voucher_detail.unit_price = -10
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:unit_price]).to include('は0以上の値にしてください')
    end

    it 'product_unitがないとNG' do
      @voucher_detail.product_unit = ''
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:product_unit]).to include('を入力してください')
    end

    it 'quantityがないとNG' do
      @voucher_detail.quantity = ''
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:quantity]).to include('を入力してください')
    end

    it 'quantityが数字以外だとNG' do
      @voucher_detail.quantity = 'おはよう'
      @voucher_detail.valid?
      expect(@voucher_detail.errors[:quantity]).to include('は数値で入力してください')
    end
  end
end
