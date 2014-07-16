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

ActiveRecord::Schema.define(version: 20140715191232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "emails"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_items", force: true do |t|
    t.string   "container"
    t.string   "location"
    t.string   "weight"
    t.integer  "export_id"
    t.integer  "movement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exports", force: true do |t|
    t.string   "export_type"
    t.string   "shipping_line"
    t.integer  "placed"
    t.string   "release_order_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_items", force: true do |t|
    t.string   "container_number"
    t.string   "trailer_number"
    t.string   "tr_code"
    t.string   "truck_number"
    t.string   "current_location"
    t.string   "bond_direction"
    t.string   "bond_number"
    t.string   "status"
    t.integer  "import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "bl_number"
    t.date     "estimate_arrival"
    t.string   "description"
    t.string   "rate"
    t.string   "status"
    t.date     "out_of_port_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movements", force: true do |t|
    t.string   "booking_number"
    t.string   "truck_number"
    t.string   "vessel_targeted"
    t.string   "point_of_destination"
    t.string   "point_of_loading"
    t.date     "estimate_delivery"
    t.string   "movement_type"
    t.string   "shipping_seal"
    t.string   "custom_seal"
    t.string   "current_location"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "equipment"
    t.integer  "quantity"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
