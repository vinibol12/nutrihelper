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

ActiveRecord::Schema.define(version: 20161117060546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anthropometric_evaluations", force: :cascade do |t|
    t.integer  "appointment_id", null: false
    t.integer  "patient_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_anthropometric_evaluations_on_appointment_id", using: :btree
    t.index ["patient_id"], name: "index_anthropometric_evaluations_on_patient_id", using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "bmi_measurements", force: :cascade do |t|
    t.integer  "anthropometric_evaluation_id", null: false
    t.float    "weight"
    t.integer  "height"
    t.float    "bmi"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["anthropometric_evaluation_id"], name: "index_bmi_measurements_on_anthropometric_evaluation_id", using: :btree
  end

  create_table "body_compositions", force: :cascade do |t|
    t.integer  "atropometric_evaluation_id", null: false
    t.decimal  "fat_percentage"
    t.float    "fat_mass"
    t.float    "lean_mass"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["atropometric_evaluation_id"], name: "index_body_compositions_on_atropometric_evaluation_id", using: :btree
  end

  create_table "cards", id: false, force: :cascade do |t|
    t.string "visa"
    t.string "master"
  end

  create_table "circumference_measurements", force: :cascade do |t|
    t.integer  "anthropometric_evaluation_id", null: false
    t.integer  "abdomen"
    t.integer  "waist"
    t.integer  "hip"
    t.integer  "arm"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["anthropometric_evaluation_id"], name: "index_circumference_on_anthropometric_evaluation_id", using: :btree
  end

  create_table "skin_fold_measurements", force: :cascade do |t|
    t.integer  "anthropometric_evaluation_id", null: false
    t.integer  "triceps"
    t.integer  "subscapular"
    t.integer  "thigh"
    t.integer  "iliac_crest"
    t.integer  "abdominal"
    t.integer  "chest"
    t.integer  "axilla"
    t.integer  "calf"
    t.integer  "biceps"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["anthropometric_evaluation_id"], name: "index_skin_fold_measurements_on_anthropometric_evaluation_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "gender"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
