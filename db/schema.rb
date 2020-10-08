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

ActiveRecord::Schema.define(version: 2020_10_07_160418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comunas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "party_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_contracts_on_party_id"
    t.index ["service_id"], name: "index_contracts_on_service_id"
  end

  create_table "coverages", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "comuna_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comuna_id"], name: "index_coverages_on_comuna_id"
    t.index ["service_id"], name: "index_coverages_on_service_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "comuna_id"
    t.string "address"
    t.integer "cost"
    t.boolean "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comuna_id"], name: "index_parties_on_comuna_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "capacity"
    t.integer "price"
    t.float "rating", default: 5.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "parties"
  add_foreign_key "contracts", "services"
  add_foreign_key "coverages", "comunas"
  add_foreign_key "coverages", "services"
  add_foreign_key "parties", "comunas"
end
