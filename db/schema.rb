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

ActiveRecord::Schema.define(version: 20180622163439) do

  create_table "amenities", force: :cascade do |t|
    t.string  "name"
    t.integer "property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string  "name"
    t.integer "price"
    t.string  "location"
    t.string  "description"
    t.string  "amenities"
    t.string  "available_for"
    t.integer "user_id"
    t.integer "property_type_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
