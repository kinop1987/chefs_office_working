require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do 
    order = create(:order)
    @memo = build(:memo, order_id: order.id)
  end

  describe 'バリデーション' do
    it 'textがあればOK' do
      expect(@memo.valid?).to eq(true)
    end

    it 'textがなければNG' do
      @memo.text = ""
      expect(@memo.valid?).to eq(false)
    end
  end


end
