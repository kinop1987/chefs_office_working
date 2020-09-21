require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before do
    @supplier = create(:supplier)
    @product = build(:product, supplier_id: @supplier.id)
  end

  describe 'GET #index' do
    context 'when supplier login' do
      it 'responds successfully' do
        sign_in @supplier
        get products_path
        expect(response).to be_success
      end
    end
  end
end
