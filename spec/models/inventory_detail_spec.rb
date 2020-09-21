require 'rails_helper'

RSpec.describe InventoryDetail, type: :model do
  before do
    order = create(:order)
    supplier = create(:supplier)
    inventory = create(:inventory, supplier_id: supplier.id, order_id: order.id)
    @inventory_detail = build(:inventory_detail, order_id: order.id, inventory_id: inventory.id)
  end

  describe 'validation test' do
    it 'it is valid with product_name, unit_price, quantity, product_unit, inventory_day' do
      @inventory_detail.valid?
      expect(@inventory_detail).to be_valid
    end

    it 'it is invalid without product_name' do
      @inventory_detail.product_name = ''
      @inventory_detail.valid?
      expect(@inventory_detail.errors.added?(:product_name, :blank)).to be_truthy
    end

    it 'it is invalid without unit_price' do
      @inventory_detail.unit_price = ''
      @inventory_detail.valid?
      expect(@inventory_detail.errors.added?(:unit_price, :blank)).to be_truthy
    end

    it 'it is invalid if unit_price if less_than 0' do
      @inventory_detail.unit_price = - 1
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:unit_price, :greater_than_or_equal_to)).to be_truthy
    end

    it 'it is invalid without quantity' do
      @inventory_detail.quantity = ''
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:quantity, :blank)).to be_truthy
    end

    it 'it is invalid if quantity is less_than 0' do
      @inventory_detail.quantity = - 1
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:quantity, :greater_than_or_equal_to)).to be_truthy
    end

    it 'it is invalid without product_unit' do
      @inventory_detail.product_unit = ''
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:product_unit, :blank)).to be_truthy
    end

    it 'it is invalid without inventory_day' do
      @inventory_detail.inventory_day = ''
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:inventory_day, :blank)).to be_truthy
    end

    it 'it is invalid if invalid_day is string' do
      @inventory_detail.inventory_day = 'おはよう'
      @inventory_detail.valid?
      expect(@inventory_detail.errors.of_kind?(:inventory_day, :blank)).to be_truthy
    end
  end
end
