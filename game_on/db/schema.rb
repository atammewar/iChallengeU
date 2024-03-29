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

ActiveRecord::Schema.define(version: 20151222013505) do

  create_table "bike_records", force: :cascade do |t|
    t.integer  "duration",   limit: 4
    t.decimal  "distance",             precision: 12, scale: 7
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "actable_id",   limit: 4
    t.string   "actable_type", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "run_records", force: :cascade do |t|
    t.integer  "duration",   limit: 4
    t.decimal  "distance",             precision: 12, scale: 7
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.boolean  "admin",      limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "weight_records", force: :cascade do |t|
    t.integer  "duration",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
