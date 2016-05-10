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

ActiveRecord::Schema.define(version: 20160510200247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "title",                                                null: false
    t.text     "text_menu"
    t.text     "html_menu"
    t.decimal  "max_price",     precision: 20, scale: 2, default: 0.0
    t.decimal  "min_price",     precision: 20, scale: 2, default: 0.0
    t.integer  "restaurant_id",                                        null: false
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "restaurant_owners", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.string   "surname",                             null: false
    t.string   "full_name"
    t.string   "email",                               null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "restaurant_owners", ["confirmation_token"], name: "index_restaurant_owners_on_confirmation_token", unique: true, using: :btree
  add_index "restaurant_owners", ["email"], name: "index_restaurant_owners_on_email", unique: true, using: :btree
  add_index "restaurant_owners", ["reset_password_token"], name: "index_restaurant_owners_on_reset_password_token", unique: true, using: :btree
  add_index "restaurant_owners", ["unlock_token"], name: "index_restaurant_owners_on_unlock_token", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name",                null: false
    t.text     "description"
    t.string   "email",               null: false
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "zip_code"
    t.string   "province"
    t.string   "full_address"
    t.integer  "restaurant_owner_id", null: false
  end

  add_index "restaurants", ["email"], name: "index_restaurants_on_email", using: :btree

  create_table "restaurants_zones", id: false, force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "zone_id",       null: false
  end

  add_index "restaurants_zones", ["restaurant_id", "zone_id"], name: "index_restaurants_zones_on_restaurant_id_and_zone_id", unique: true, using: :btree
  add_index "restaurants_zones", ["zone_id", "restaurant_id"], name: "index_restaurants_zones_on_zone_id_and_restaurant_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
    t.string   "surname",    null: false
    t.string   "full_name"
    t.string   "email",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "zones", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
  end

  add_index "zones", ["name"], name: "index_zones_on_name", unique: true, using: :btree

  add_foreign_key "menus", "restaurants"
  add_foreign_key "restaurants", "restaurant_owners"
end
