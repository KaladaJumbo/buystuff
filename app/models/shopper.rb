class Shopper < ApplicationRecord
    has_many :orders 
    has_many :customers, through: :orders 
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :username, presence: true
    validates :address, presence: true
end
