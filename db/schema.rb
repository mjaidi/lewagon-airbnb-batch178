# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_29_094128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "description"
    t.string "address"
    t.integer "price_per_day"
    t.integer "service_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "appt_reviews", force: :cascade do |t|
    t.bigint "booking_id"
    t.integer "rating"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_appt_reviews_on_booking_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "apartment_id"
    t.boolean "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "equips", force: :cascade do |t|
    t.string "name"
  end

  create_table "join_apt_equips", force: :cascade do |t|
    t.bigint "apartment_id"
    t.bigint "equip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_join_apt_equips_on_apartment_id"
    t.index ["equip_id"], name: "index_join_apt_equips_on_equip_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "apartment_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_photos_on_apartment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "host_flag"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apartments", "users"
  add_foreign_key "appt_reviews", "bookings"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "users"
  add_foreign_key "join_apt_equips", "apartments"
  add_foreign_key "join_apt_equips", "equips"
  add_foreign_key "photos", "apartments"
end
