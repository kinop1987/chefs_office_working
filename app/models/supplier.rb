class Supplier < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name,     length: {maximum: 30}
    validates :email,    uniqueness: {case_sensitive: false},
                         format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, length: {minimum: 7}
    validates :telephone, format: {with: /^0\d{1,4}-\d{1,4}-\d{3,4}$/}
    validates :pic, length: {maximum: 10}
  end
end
