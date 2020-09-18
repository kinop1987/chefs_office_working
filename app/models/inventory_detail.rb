class InventoryDetail < ApplicationRecord
  belongs_to :inventory
  with_options presence: true do
    validates :product_name
    validates :unit_price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :quantity, numericality: true
    validates :inventory_day
    validates :product_unit
  end

  def calculate_inventory_detail_total_price
    self.total_price = self.unit_price * self.quantity
  rescue
    self.total_price = 0
  end
end
