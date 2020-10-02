class Shopper < ApplicationRecord
    has_many :orders 
    has_many :customers, through: :orders 
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :address, presence: true
end
