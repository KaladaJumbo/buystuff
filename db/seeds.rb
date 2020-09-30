# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Customer.destroy_all
Shopper.destroy_all
Item.destroy_all
Order.destroy_all
OrderItem.destroy_all

rando_boi = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,19]

20.times do 

    Item.create(description: Faker::Food.ingredient, weight: rando_boi.sample, price: rando_boi.sample)

end