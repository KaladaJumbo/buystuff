class Customer < ApplicationRecord
    has_many :orders 
    has_many :shoppers, through: :orders 
    has_secure_password

    validates :name, presence: true
    validates :address, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    def self.anyone_there? 

        return !!session[:current_customer]

    end

end
