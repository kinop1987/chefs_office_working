class Supplier < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :contracts
  has_many :orders, through: :contracts
  has_many :vouchers
  has_many :inventories
  with_options presence: true do
    validates :name,     length: { maximum: 30 }
    validates :email,    uniqueness: { case_sensitive: false },
                         format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 7 }
    validates :telephone, format: { with: /0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/ }
    validates :pic, length: { maximum: 10 }
    validates :website, length: { maximum: 30 }
  end
end
