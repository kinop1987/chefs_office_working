class Voucher < ApplicationRecord
  belongs_to :order
  belongs_to :supplier
  has_many :voucher_details
  with_options presence: true do
    validates :total_price
    validates :delivery_date
    validates :confirm
  end
  validates :comment, length: { maximum: 200 }
  validate  :date_not_before_today

  accepts_nested_attributes_for :voucher_details
  before_validation :calculate_voucher_total_price

  def calculate_voucher_total_price
    voucher_details.each(&:calculate_voucher_detail_total_price)
    self.total_price = voucher_details.map(&:total_price).sum
  end

  def date_not_before_today
    errors.add(:delivery_date) if delivery_date.nil? || delivery_date < Date.today
  end
end
