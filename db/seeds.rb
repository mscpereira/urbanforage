# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Pulling out seeds"
Restaurant.delete_all

puts "Planting new ones"

16.times do
  Restaurant.create(
  name: Faker::Restaurant.name,
  cuisine: Faker::Restaurant.type,
  address: Faker::Address.street_address,
  website: Faker::Internet.url,
  phone_number: Faker::PhoneNumber.cell_phone,
  menu: rand(1..10),
  price_range: "$" * rand(1..4),
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude,
  image: 'https://source.unsplash.com/random'
)
end

puts "#{Restaurant.count} restaurant seeds planted"
