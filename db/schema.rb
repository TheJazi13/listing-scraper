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

ActiveRecord::Schema.define(version: 20131226054108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "landlords", force: true do |t|
    t.string   "company_id"
    t.string   "website"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.text     "short_description"
    t.text     "long_description"
    t.integer  "bedroom_count"
    t.integer  "bathroom_count"
    t.float    "price"
    t.string   "website"
    t.text     "name"
    t.float    "deposit"
    t.integer  "square_feet"
    t.integer  "year_built"
    t.boolean  "pet_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.integer  "landlord_id"
  end

  add_index "listings", ["landlord_id"], name: "index_listings_on_landlord_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
  end

  add_index "photos", ["listing_id"], name: "index_photos_on_listing_id", using: :btree

end
