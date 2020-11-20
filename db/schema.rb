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

ActiveRecord::Schema.define(version: 2020_11_20_030325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_attendees_on_party_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

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

  create_table "interesteds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "offer"
    t.index ["party_id"], name: "index_interesteds_on_party_id"
    t.index ["user_id"], name: "index_interesteds_on_user_id"
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
    t.bigint "user_id"
    t.integer "capacity"
    t.boolean "over"
    t.index ["comuna_id"], name: "index_parties_on_comuna_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "partyreviews", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_partyreviews_on_party_id"
    t.index ["user_id"], name: "index_partyreviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "servicereviews", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_servicereviews_on_service_id"
    t.index ["user_id"], name: "index_servicereviews_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "capacity"
    t.integer "price"
    t.float "rating", default: 5.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "status", default: "pending"
    t.index ["user_id"], name: "index_services_on_user_id"
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
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "attendees", "parties"
  add_foreign_key "attendees", "users"
  add_foreign_key "contracts", "parties"
  add_foreign_key "contracts", "services"
  add_foreign_key "coverages", "comunas"
  add_foreign_key "coverages", "services"
  add_foreign_key "interesteds", "parties"
  add_foreign_key "interesteds", "users"
  add_foreign_key "parties", "comunas"
  add_foreign_key "parties", "users"
  add_foreign_key "partyreviews", "parties"
  add_foreign_key "partyreviews", "users"
  add_foreign_key "servicereviews", "services"
  add_foreign_key "servicereviews", "users"
  add_foreign_key "services", "users"
end
