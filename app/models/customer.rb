class Customer < ApplicationRecord
    has_many :orders 
    has_many :shoppers, through: :orders 
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :address, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
