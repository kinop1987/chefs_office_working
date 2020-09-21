require 'rails_helper'

RSpec.describe ContractDetail, type: :model do
  before do
    supplier = create(:supplier)
    order = create(:order)
    contract = create(:contract, order_id: order.id, supplier_id: supplier.id)
    @contract_detail = build(:contract_detail, supplier_id: supplier.id, order_id: order.id, contract_id: contract.id)
  end

  describe 'バリデーション' do
    it 'delivery_date, total_price, product_name, unit_price, product_unitがあればOK' do
      @contract_detail.valid?
      expect(@contract_detail).to be_valid
    end

    it 'delivery_dateがないとNG' do
      @contract_detail.delivery_date = ''
      @contract_detail.valid?
      expect(@contract_detail.errors[:delivery_date]).to include('を入力してください')
    end

    it 'delivery_dateがないとNG' do
      @contract_detail.delivery_date = Date.yesterday
      @contract_detail.valid?
      expect(@contract_detail.errors[:delivery_date]).to include('は不正な値です')
    end

    it 'total_priceはなくてもOK' do
      @contract_detail.total_price = ''
      @contract_detail.valid?
      expect(@contract_detail).to be_valid
    end

    it 'produt_nameがないとNG' do
      @contract_detail.product_name = ''
      @contract_detail.valid?
      expect(@contract_detail.errors[:product_name]).to include('を入力してください')
    end

    it 'unit_priceはなくてもOK' do
      @contract_detail.unit_price = ''
      @contract_detail.valid?
      expect(@contract_detail).to be_valid
    end

    it 'product_unitがないとNG' do
      @contract_detail.product_unit = ''
      @contract_detail.valid?
      expect(@contract_detail.errors[:product_unit]).to include('を入力してください')
    end
  end
end
