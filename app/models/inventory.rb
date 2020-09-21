class Inventory < ApplicationRecord
  belongs_to :order
  belongs_to :supplier
  has_many :inventory_details, dependent: :destroy
  with_options presence: true do
    validates :total_price
    validates :inventory_month
  end

  accepts_nested_attributes_for :inventory_details
  before_validation :calculate_inventory_total_price

  def calculate_inventory_total_price
    inventory_details.each(&:calculate_inventory_detail_total_price)
    self.total_price = inventory_details.map(&:total_price).sum
  end
end
