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
Apartment.destroy_all
User.destroy_all
Equip.destroy_all

puts "adding data"
booking_status = ["accepted", "pending", "rejected"]
equipment = ["wifi", "washer", "kitchen", "animal friendly", "heating", "air conditioning", "parking", "TV", "private entance", "essentials", "fireplace"]

equipment.each do |e|
  Equip.create!(name: e)
end

user1 = User.create(email: "majid.jaidi@gmail.com", password: "123456789", first_name: "Majid", last_name: "Jaidi", host_flag: false )

user2 = User.create(email: "yashan@gmail.com", password: "987654321", first_name: "Yasmina", last_name: "Hannaoui", host_flag: true)

10.times do
  apartment = Apartment.create!(user_id: user1.id, description: Faker::BojackHorseman.quote, address: Faker::Address.full_address, price_per_day: rand(150), service_fees: rand(50) )
  start_equip_id = Equip.first.id
  end_equip_id = Equip.last.id
  5.times do
    JoinAptEquip.create!(equip_id: rand(start_equip_id..end_equip_id), apartment_id: apartment.id)
  end
  10.times do
    startdate = Date.new(2018,rand(1..12),rand(1..28))
    enddate = startdate + rand(10)
    booking = Booking.create!(user_id: user1.id, apartment_id: apartment.id, status: booking_status.sample, start_date: startdate, end_date: enddate)
    ApptReview.create!(booking_id: booking.id, rating: rand(1..5), comment: Faker::FamousLastWords.last_words)
  end
end

10.times do
  apartment = Apartment.create!(user_id: user2.id, description: Faker::BojackHorseman.quote, address: Faker::Address.full_address, price_per_day: rand(150), service_fees: rand(50) )
  start_equip_id = Equip.first.id
  end_equip_id = Equip.last.id
  5.times do
    JoinAptEquip.create!(equip_id: rand(start_equip_id..end_equip_id), apartment_id: apartment.id)
  end
  10.times do
    startdate = Date.new(2018,rand(1..12),rand(1..28))
    enddate = startdate + rand(10)
    booking = Booking.create!(user_id: user1.id, apartment_id: apartment.id, status: booking_status.sample, start_date: startdate, end_date: enddate)
    ApptReview.create!(booking_id: booking.id, rating: rand(1..5), comment: Faker::FamousLastWords.last_words)
  end
end


puts "seed completed"