require 'rails_helper'

RSpec.describe Voucher, type: :model do
  before do
    supplier = create(:supplier)
    order = create(:order)
    @voucher = build(:voucher, supplier_id: supplier.id, order_id: order.id)
  end

  describe 'バリデーション' do
    it 'delivery_date, tcommentがあればOK' do
      @voucher.valid?
      expect(@voucher).to be_valid
    end

    it 'delivery_dateがないとNG' do
      @voucher.delivery_date = ''
      @voucher.valid?
      expect(@voucher.errors[:delivery_date]).to include('を入力してください')
    end

    it 'delivery_dateが昨日以前だとNG' do
      @voucher.delivery_date = Date.yesterday
      @voucher.valid?
      expect(@voucher.errors[:delivery_date]).to include('は不正な値です')
    end

    it 'total_priceは自動保存' do
      @voucher.total_price = ''
      @voucher.valid?
      expect(@voucher).to be_valid
    end

    it 'commentはなくてもOK' do
      @voucher.comment = ''
      @voucher.valid?
      expect(@voucher).to be_valid
    end

    it 'confirmがないとNG' do
      @voucher.confirm = nil
      @voucher.valid?
      expect(@voucher.errors[:confirm]).to include('を入力してください')
    end
  end
end
