class VoucherDetail < ApplicationRecord
  belongs_to :voucher
  with_options presence: true do
    validates :product_name
    validates :unit_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { only_integer: true }
    validates :delivery_date
    validates :product_unit
  end
  validate :date_not_before_today

  def calculate_voucher_detail_total_price
    self.total_price = unit_price * quantity
  rescue StandardError
    self.total_price = 0
  end

  def date_not_before_today
    errors.add(:delivery_date) if delivery_date.nil? || delivery_date < Date.today
  end
end
