
5.times do
	City.create(name: Faker::GameOfThrones.city, zip: Faker::Address.zip_code)
end
puts '5 villes crees'

5.times do # add description
	User.create(mail: Faker::Internet.unique.free_email, phone_number: Faker::PhoneNumber.phone_number, description: Faker::ChuckNorris.fact)
end
puts '5 users crees'

5.times do #had has_wifi
	Listing.create(admin: User.all.sample, city: City.all.sample, available_beds: rand(1..5), price: rand(15..100), description: Faker::Lorem.paragraph_by_chars(141, false), welcome_message: Faker::ChuckNorris.fact, has_wifi: Faker::Boolean.boolean)
end
puts '5 listings crees'

5.times do
	Reservation.create(start_date: Faker::Date.forward(3), end_date: Faker::Date.between(4.days.from_now, 7.days.from_now), listing: Listing.all.sample, guest: User.all.sample)
end
puts '5 resas crees'

# 60.times do |i|
# 	Day.create(name: Time.now.to_date + i,is_taken_by: reservation_id)
# end
# puts '60 jours crees'