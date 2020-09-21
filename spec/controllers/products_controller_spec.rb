require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @supplier = create(:supplier)
    sign_in(@supplier)
  end

  describe 'GET #new' do
    before do
      @product = build(:product, supplier_id: @supplier.id)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end

    it 'renders root_path if @product.supplier_id != current_supplier.id' do
      @product.supplier_id = 4
      get :new
      expect(response).to render_template root_path
    end
  end

  describe 'GET #edit' do
    let(:product) { create(:product, supplier_id: @supplier.id) }

    it 'assigns producg' do
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end

    it 'renders the :edit template' do
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end

  describe 'Get #index' do
    before do
      @products = create_list(:product, 3, supplier_id: @supplier.id)
      get :index
    end

    it 'render index' do
      expect(response).to render_template :index
    end

    it 'assigns the @groups' do
      expect(assigns(:products)).to eq @products
    end
  end
end
