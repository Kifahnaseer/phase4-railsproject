class User < ApplicationRecord
    has_secure_password

    has_many :orders
    has_many :order_items, through: :orders

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }
end
