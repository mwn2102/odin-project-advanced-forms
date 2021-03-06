# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151005005745) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bookings", ["flight_id"], name: "index_bookings_on_flight_id"
  add_index "bookings", ["passenger_id"], name: "index_bookings_on_passenger_id"

  create_table "flights", force: :cascade do |t|
    t.integer  "from_airport_id"
    t.integer  "to_airport_id"
    t.datetime "date"
    t.integer  "duration"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "flights", ["from_airport_id"], name: "index_flights_on_from_airport_id"
  add_index "flights", ["to_airport_id"], name: "index_flights_on_to_airport_id"

  create_table "passenger_bookings", force: :cascade do |t|
    t.integer  "passenger_id"
    t.integer  "booking_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "passenger_bookings", ["booking_id"], name: "index_passenger_bookings_on_booking_id"
  add_index "passenger_bookings", ["passenger_id"], name: "index_passenger_bookings_on_passenger_id"

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

end
