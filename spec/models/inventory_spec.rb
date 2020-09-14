require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before do  
    order = create(:order)
    supplier = create(:supplier)
    @inventory = build(:inventory, order_id: order.id, supplier_id: supplier.id)  
  end

  describe "validation test" do
    it "it is valid with inventory_month, text and image" do
      @inventory.valid?
      expect(@inventory).to be_valid
    end

    it "it is invalid without inventory_month" do
      @inventory.inventory_month = ""
      @inventory.valid?
      expect(@inventory.errors.added?(:inventory_month, :blank)).to be_truthy
    end

  end
end
