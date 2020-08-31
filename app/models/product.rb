class Product < ApplicationRecord
  belongs_to :supplier
  with_options presence: true do
    validates :product_name,     length: {maximum: 30}
    validates :product_unit, length: {maximum: 20}
    validates :availability, inclusion: { in: [true, false] }
  end
validates :product_price, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  
end
