class ContractDetail < ApplicationRecord
  belongs_to :contract
  with_options presence: true do
    validates :product_name
    validates :quantity,  allow_blank: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
    validates :delivery_date
    validates :product_unit
  end
  validate  :date_not_before_today


  def calculate_contract_detail_total_price
    self.total_price = self.unit_price * self.quantity
  rescue
    self.total_price = 0
  end

  def date_not_before_today
    errors.add(:delivery_date) if delivery_date.nil? || delivery_date < Date.today
  end
end
