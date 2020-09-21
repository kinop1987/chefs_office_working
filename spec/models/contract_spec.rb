require 'rails_helper'

RSpec.describe Contract, type: :model do
  before do
    supplier = create(:supplier)
    order = create(:order)
    @contract = build(:contract, supplier_id: supplier.id, order_id: order.id)
  end

  describe 'バリデーション' do
    it 'delivery_date, total_price, commentがあればOK' do
      @contract.valid?
      expect(@contract).to be_valid
    end

    it 'delivery_dateがないとNG' do
      @contract.delivery_date = ''
      @contract.valid?
      expect(@contract.errors[:delivery_date]).to include('を入力してください')
    end

    it 'delivery_dateが昨日以前だとNG' do
      @contract.delivery_date = Date.yesterday
      @contract.valid?
      expect(@contract.errors[:delivery_date]).to include('は不正な値です')
    end

    it 'total_priceは自動保存' do
      @contract.total_price = ''
      @contract.valid?
      expect(@contract).to be_valid
    end

    it 'commentはなくてもOK' do
      @contract.comment = ''
      @contract.valid?
      expect(@contract).to be_valid
    end
  end
end
