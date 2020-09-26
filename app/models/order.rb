class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :shopper, required: false
    has_many :order_items
    has_many :items, through: :order_items

    validates :item_ids, presence: true 
end
