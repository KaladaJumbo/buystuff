class Customer < ApplicationRecord
    has_many :orders 
    has_many :shoppers, through: :orders 
end
