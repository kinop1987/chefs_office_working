class ContractDetail < ApplicationRecord
  belongs_to :contract
  with_options presence: true do
    validates :product_unit
    validates :quantity,  allow_blank: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  end


  def calculate_order_detail_total_price
    self.total_price = self.unit_price * self.quantity
  rescue
    self.total_price = 0
  end
end
