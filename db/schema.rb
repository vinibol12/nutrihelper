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

ActiveRecord::Schema.define(version: 20180502070380) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anthropometric_evaluations", force: :cascade do |t|
    t.integer  "appointment_id",                              null: false
    t.decimal  "fat_percentage",      precision: 5, scale: 2
    t.decimal  "fat_mass",            precision: 5, scale: 2
    t.decimal  "lean_mass",           precision: 5, scale: 2
    t.decimal  "abdomen",             precision: 5, scale: 2
    t.decimal  "waist",               precision: 5, scale: 2
    t.decimal  "hip",                 precision: 5, scale: 2
    t.decimal  "arm",                 precision: 5, scale: 2
    t.decimal  "weight",              precision: 6, scale: 3
    t.decimal  "height",              precision: 6, scale: 3
    t.decimal  "bmi",                 precision: 6, scale: 3
    t.decimal  "triceps",             precision: 5, scale: 2
    t.decimal  "subscapular",         precision: 5, scale: 2
    t.decimal  "thigh",               precision: 5, scale: 2
    t.decimal  "iliac_crest",         precision: 5, scale: 2
    t.decimal  "abdominal",           precision: 5, scale: 2
    t.decimal  "chest",               precision: 5, scale: 2
    t.decimal  "axilla",              precision: 5, scale: 2
    t.decimal  "body_fat",            precision: 5, scale: 2
    t.decimal  "body_fat_percentage", precision: 5, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["appointment_id"], name: "index_anthropometric_evaluations_on_appointment_id", using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "gender"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
