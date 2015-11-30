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

ActiveRecord::Schema.define(version: 20151130085920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "abv"
    t.string   "ibu"
    t.string   "srm"
    t.string   "upc"
    t.string   "filepath"
    t.string   "description"
    t.integer  "brewery_id"
    t.integer  "category_id"
    t.integer  "style_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "beers", ["abv"], name: "index_beers_on_abv", using: :btree
  add_index "beers", ["description"], name: "index_beers_on_description", using: :btree
  add_index "beers", ["ibu"], name: "index_beers_on_ibu", using: :btree
  add_index "beers", ["name"], name: "index_beers_on_name", using: :btree
  add_index "beers", ["srm"], name: "index_beers_on_srm", using: :btree
  add_index "beers", ["upc"], name: "index_beers_on_upc", using: :btree

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "code"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.string   "filepath"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "breweries", ["address1"], name: "index_breweries_on_address1", using: :btree
  add_index "breweries", ["address2"], name: "index_breweries_on_address2", using: :btree
  add_index "breweries", ["city"], name: "index_breweries_on_city", using: :btree
  add_index "breweries", ["code"], name: "index_breweries_on_code", using: :btree
  add_index "breweries", ["country"], name: "index_breweries_on_country", using: :btree
  add_index "breweries", ["name"], name: "index_breweries_on_name", using: :btree
  add_index "breweries", ["phone"], name: "index_breweries_on_phone", using: :btree
  add_index "breweries", ["state"], name: "index_breweries_on_state", using: :btree
  add_index "breweries", ["website"], name: "index_breweries_on_website", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "geocodes", force: :cascade do |t|
    t.integer  "brewery_id"
    t.decimal  "latitude",   precision: 19, scale: 15
    t.decimal  "longitude",  precision: 19, scale: 15
    t.string   "accuracy"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "geocodes", ["accuracy"], name: "index_geocodes_on_accuracy", using: :btree
  add_index "geocodes", ["latitude"], name: "index_geocodes_on_latitude", using: :btree
  add_index "geocodes", ["longitude"], name: "index_geocodes_on_longitude", using: :btree

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "styles", ["name"], name: "index_styles_on_name", using: :btree

end
