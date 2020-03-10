# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_03_10_151916) do

  create_table "head_nurses", force: :cascade do |t|
    t.integer "nurse_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
=======
ActiveRecord::Schema.define(version: 20_200_303_134_741) do
  create_table 'head_nurses', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'nurse_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
>>>>>>> 5c8fdec2a0f9cf20f41ad6b1a8e9c0ba72b4a8d8
  end

  create_table 'nurse_patients', force: :cascade do |t|
    t.integer 'nurse_id'
    t.integer 'patient_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

<<<<<<< HEAD
  create_table "nurses", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "head_nurse_id"
=======
  create_table 'nurses', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
>>>>>>> 5c8fdec2a0f9cf20f41ad6b1a8e9c0ba72b4a8d8
  end

  create_table 'patients', force: :cascade do |t|
    t.integer 'user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'address'
    t.string 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
