# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'



puts "cleaning database"

ApptReview.destroy_all
Booking.destroy_all
JoinAptEquip.destroy_all
Photo.destroy_all
Apartment.destroy_all
User.destroy_all
Equip.destroy_all

puts "adding data"
booking_status = ["accepted", "pending", "rejected"]
equipment = ["wifi", "washer", "kitchen", "animal friendly", "heating", "air conditioning", "parking", "TV", "private entance", "essentials", "fireplace"]
url = [
 "https://res.cloudinary.com/mjedi/image/upload/v1535535446/Airbnb-Seeds/mike-marquez-592014-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535434/Airbnb-Seeds/kasper-rasmussen-710584-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535434/Airbnb-Seeds/olivier-collet-720456-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535432/Airbnb-Seeds/grant-707825-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535432/Airbnb-Seeds/element5-digital-685202-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535431/Airbnb-Seeds/alisha-hieb-364487-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535430/Airbnb-Seeds/victor-garcia-682037-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535430/Airbnb-Seeds/bernard-hermant-604938-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535425/Airbnb-Seeds/kara-michelle-544960-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535423/Airbnb-Seeds/anna-sullivan-635346-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535420/Airbnb-Seeds/chuttersnap-596059-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535418/Airbnb-Seeds/ian-dooley-331076-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535415/Airbnb-Seeds/chuttersnap-362512-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535415/Airbnb-Seeds/alesia-kazantceva-362296-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535411/Airbnb-Seeds/ian-dooley-331063-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535415/Airbnb-Seeds/kinga-cichewicz-382441-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535411/Airbnb-Seeds/dane-deaner-272375-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535410/Airbnb-Seeds/patrick-perkins-340019-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535408/Airbnb-Seeds/david-hellmann-256150-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535408/Airbnb-Seeds/paul-hanaoka-369639-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535407/Airbnb-Seeds/neonbrand-263851-unsplash.jpg",
 "https://res.cloudinary.com/mjedi/image/upload/v1535535407/Airbnb-Seeds/justin-schuler-253611-unsplash.jpg"
]


equipment.each do |e|
  Equip.create!(name: e)
end

# creating users
user1 = User.create(email: "majid.jaidi@gmail.com", password: "123456789", first_name: "Majid", last_name: "Jaidi", host_flag: true )
user2 = User.create(email: "yashan@gmail.com", password: "987654321", first_name: "Yasmina", last_name: "Hannaoui", host_flag: true)
user3 = User.create(email: "elhaji@gmail.com", password: "123456789", first_name: "Elhaji", last_name: "Diagne", host_flag: false)

#creating Apartments
i = 0
apt1 = Apartment.create!(user_id: user1.id, name: "By the water", description: Faker::Lorem.paragraph, address: "Maarif, Casablanca, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt1.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
  end

apt2 = Apartment.create!(user_id: user1.id, name: "Most comfortable", description: Faker::Lorem.paragraph, address: "Sidi Maarouf, Casablanca, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt2.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt3 = Apartment.create!(user_id: user1.id, name: "Be a tourist", description: Faker::Lorem.paragraph, address: "Jamaa el-Fna, Marrakech, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt3.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt4 = Apartment.create!(user_id: user1.id, name: "Chill in the North", description: Faker::Lorem.paragraph, address: "Tanger, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt4.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt5 = Apartment.create!(user_id: user1.id, name: "Perfect for a Party", description: Faker::Lorem.paragraph, address: "Marbella, Spain", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt5.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt6 = Apartment.create!(user_id: user2.id, name: "Discover beauties by the beach", description: Faker::Lorem.paragraph, address: "Faro, Portugal", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt6.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt7 = Apartment.create!(user_id: user2.id, name: "Desert Paradise", description: Faker::Lorem.paragraph, address: "Merzouga, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt7.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt8 = Apartment.create!(user_id: user2.id, name: "Take a Chill Pill", description: Faker::Lorem.paragraph, address: "Chefchaouen, Morocco", price_per_day: rand(150), service_fees: rand(50) )
  3.times do
    photo = Photo.new(apartment_id: apt8.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt9 = Apartment.create!(user_id: user2.id, name: "Enjoy the Sun", description: Faker::Lorem.paragraph, address: "Tenerife, Spain", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt9.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt10 = Apartment.create!(user_id: user2.id, name: "I'm Loving It", description: Faker::Lorem.paragraph, address: "Lisbon, Portugal", price_per_day: rand(150), service_fees: rand(50) )
  3.times do
    photo = Photo.new(apartment_id: apt10.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end            

apartments = [apt1, apt2, apt3, apt4, apt5, apt6, apt7, apt8, apt9, apt10]

apartments.each do |a|
  5.times do
    start_equip_id=Equip.first.id
    end_equip_id=Equip.last.id
    JoinAptEquip.create!(equip_id: rand(start_equip_id..end_equip_id), apartment_id: a.id)
  end
  10.times do
    startdate = Date.new(2018,rand(1..12),rand(1..28))
    enddate = startdate + rand(10)
    booking = Booking.create!(user_id: user1.id, apartment_id: a.id, status: booking_status.sample, start_date: startdate, end_date: enddate)
    ApptReview.create!(booking_id: booking.id, rating: rand(1..5), comment: Faker::FamousLastWords.last_words)
  end
end


puts "seed completed"