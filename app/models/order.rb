class Order < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memos, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :suppliers, through: :contracts
  has_many :vouchers
  has_many :cookings, dependent: :destroy
  with_options presence: true do
    validates :name,     length: {maximum: 30}
    validates :email,    uniqueness: {case_sensitive: false},
                         format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, length: {minimum: 7}
    validates :telephone, format: {with: /0[1-9]\d{0,3}[-]\d{1,4}[-]\d{4}/}
    validates :address, length: {maximum: 50}
  end
      
end
