class Contract < ApplicationRecord
  belongs_to :order
  belongs_to :supplier
  has_many :contract_details, dependent: :destroy
  with_options presence: true do
    validates :total_price
    validates :delivery_date
  end

  validate  :date_not_before_today

  def date_not_before_today
    errors.add(:delivery_date) if dalivery_date.nil? || delivery_date < Date.today
  end
end
