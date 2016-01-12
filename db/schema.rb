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

ActiveRecord::Schema.define(version: 20160111231649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.integer  "year"
    t.boolean  "sold"
    t.integer  "dealership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "price"
  end

  add_index "cars", ["dealership_id"], name: "index_cars_on_dealership_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.string   "email"
    t.integer  "dealership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "customers", ["dealership_id"], name: "index_customers_on_dealership_id", using: :btree

  create_table "dealerships", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salesmen", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.float    "total_sales"
    t.integer  "dealership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "salesmen", ["dealership_id"], name: "index_salesmen_on_dealership_id", using: :btree

  add_foreign_key "cars", "dealerships"
  add_foreign_key "customers", "dealerships"
  add_foreign_key "salesmen", "dealerships"
end
