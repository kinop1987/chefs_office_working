class Contract < ApplicationRecord
  belongs_to :order
  belongs_to :supplier
  has_many :contract_details, dependent: :destroy
  with_options presence: true do
    validates :total_price
    validates :delivery_date
  end

  validate  :date_not_before_today

  accepts_nested_attributes_for :contract_details
  before_validation :calculate_contract_total_price

  def calculate_contract_total_price
    contract_details.each(&:calculate_contract_detail_total_price)
    self.total_price = contract_details.map(&:total_price).sum
  end

  def date_not_before_today
    errors.add(:delivery_date) if dalivery_date.nil? || delivery_date < Date.today
  end
end
