# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   
5.times do
	City.create(name: Faker::GameOfThrones.city, zip: Faker::Address.zip_code)
end
puts '5 villes crees'

5.times do # add description
	User.create(mail: Faker::Internet.free_email, phone_number: Faker::PhoneNumber.phone_number)
end
puts '5 users crees'

5.times do #had has_wifi
	Listing.create(user: User.all.sample, city: City.all.sample, available_beds: rand(1..5), price: rand(15..100), description: Faker::Lorem.paragraph_by_chars(141, false), welcome_message: Faker::ChuckNorris.fact)
end
puts '5 listings crees'

5.times do
	Reservation.create(start_date: Faker::Date.forward(3), end_date: Faker::Date.between(4.days.from_now, 7.days.from_now), listing: Listing.all.sample, user: User.all.sample)
end
puts '5 resas crees'