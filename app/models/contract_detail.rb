class ContractDetail < ApplicationRecord
  belongs_to :contract
  with_options presence: true do
    validates :product_unit
    validates :quantity,  allow_blank: true, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  end
end
