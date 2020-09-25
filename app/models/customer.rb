class Customer < ApplicationRecord
    has_many :orders 
    has_many :shoppers, through: :orders 

    validates :name, presence: true 
    validates :address, presence: true, uniqueness: true
end
