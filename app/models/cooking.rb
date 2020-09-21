class Cooking < ApplicationRecord
  belongs_to :order
  has_many :images, dependent: :destroy
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :text, length: { maximum: 500 }
  end
  accepts_nested_attributes_for :images
  validates_associated :images
end
