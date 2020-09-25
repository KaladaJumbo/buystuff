class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :shopper
    has_many :order_items
    has_many :items, through: :order_items
end
