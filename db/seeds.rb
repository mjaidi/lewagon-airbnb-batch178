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
 "https://res.cloudinary.com/mjedi/image/upload/v1535535407/Airbnb-Seeds/justin-schuler-253611-unsplash.jpg",
 "https://cache.cosmopolitan.fr/data/photo/w660_c17/4k/airbnb-logement-piscine.jpg",
 "https://i.ytimg.com/vi/770WhGkRfHI/maxresdefault.jpg",
 "https://www.wheretraveler.com/sites/default/files/styles/promoted_image/public/gladden-private-island-aerial-water-view.jpg?itok=7oNZiDdL&timestamp=1501609215",
 "https://cdn.asiatatler.com/asiatatler/hk/i/2017/11/14142904-GladdenPrivateIsland_cropped_1584x780.jpg",
 "https://www.unilad.co.uk/wp-content/uploads/2016/02/seahorse1.jpg",
 "https://i.ytimg.com/vi/H0r1bPOmil0/maxresdefault.jpg",
 "https://les-cles-de-la-maison.devis-plus.com/wp-content/uploads/2012/05/maisons-arbres-L-15.jpeg",
 "http://www.treehousepoint.com/images/treehouse-point.jpg",
 "https://www.heesenyachts.com/app/uploads/2014/09/507-26-LADY-PETRA2emp2-640x390.jpg?x38579",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/539040?k=5857&w=1410&h=710&q=90&o=c",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/539043?k=b351&w=1410&h=710&q=90&o=c",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/654203?k=48cc&w=1410&h=710&q=90&o=c",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/654194?k=3330&w=1410&h=710&q=90&o=c",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/418153?k=db27&w=1410&h=710&q=90&o=c",
 "https://image.northropandjohnson.com/image/nj/yacht/profile/61565?k=73f7&w=1410&h=710&q=90&o=c",
 "https://www.catamarans-fountaine-pajot.com/wp-content/uploads/2018/01/photos-lucia-405-1330x800.jpg",
 "http://www.nauticwebnews.com/picfr/2017/08/fountaine-pajot-sy-67-20m.jpg"

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

# ----------Logements insolites----------

# shell house
apt11 = Apartment.create!(user_id: user2.id, name: "Original Shell House", description: Faker::Lorem.paragraph, address: "Rouen, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt11.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

# private island
apt12 = Apartment.create!(user_id: user2.id, name: "Amazing Island", description: Faker::Lorem.paragraph, address: "Rouen, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt12.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

# underwater house
apt13 = Apartment.create!(user_id: user2.id, name: "Unbelievable underwater house", description: Faker::Lorem.paragraph, address: "Rouen, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt13.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

# tree house
apt14 = Apartment.create!(user_id: user2.id, name: "Unbelievable underwater house", description: Faker::Lorem.paragraph, address: "Rouen, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt14.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end


# ----------Boats----------

apt15 = Apartment.create!(user_id: user2.id, name: "15m Yacht", description: Faker::Lorem.paragraph, address: "Marseille, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt15.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt16 = Apartment.create!(user_id: user2.id, name: "Amazing Yacht", description: Faker::Lorem.paragraph, address: "Marseille, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt16.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt17 = Apartment.create!(user_id: user2.id, name: "Pole Experience", description: Faker::Lorem.paragraph, address: "Marseille, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt17.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end

apt18 = Apartment.create!(user_id: user2.id, name: "Your own Catamaran", description: Faker::Lorem.paragraph, address: "Marseille, France", price_per_day: rand(150), service_fees: rand(50) )
  2.times do
    photo = Photo.new(apartment_id: apt18.id)
    photo.remote_photo_url = url[i]
    i += 1
    photo.save
end



apartments = [apt1, apt2, apt3, apt4, apt5, apt6, apt7, apt8, apt9, apt10, apt11, apt12, apt13, apt14, apt15, apt16, apt17, apt18]

apartments.each do |a|
  5.times do
    start_equip_id=Equip.first.id
    end_equip_id=Equip.last.id
    JoinAptEquip.create!(equip_id: rand(start_equip_id..end_equip_id), apartment_id: a.id)
  end
  5.times do
    startdate = Date.new(2018,rand(1..12),rand(1..28))
    enddate = startdate + rand(10)
    booking = Booking.create!(user_id: [user1.id, user2.id, user3.id].sample, apartment_id: a.id, status: booking_status.sample, start_date: startdate, end_date: enddate)
    ApptReview.create!(booking_id: booking.id, rating: rand(1..5), comment: Faker::FamousLastWords.last_words)
  end
  5.times do
    startdate = Date.new(2018,rand(1..12),rand(1..28))
    enddate = startdate + rand(10)
    booking = Booking.create!(user_id: [user1.id, user2.id, user3.id].sample, apartment_id: a.id, status: booking_status.sample, start_date: startdate, end_date: enddate)
  end
end


puts "seed completed"
