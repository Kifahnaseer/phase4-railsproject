class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  has_one :payment
end
