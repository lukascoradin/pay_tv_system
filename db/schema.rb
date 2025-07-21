# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_21_165752) do
  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_additional_services_on_name"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 50
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clients_on_name"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_packages_on_name"
    t.index ["plan_id"], name: "index_packages_on_plan_id"
  end

  create_table "packages_additional_services", force: :cascade do |t|
    t.integer "package_id", null: false
    t.integer "additional_service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_packages_additional_services_on_additional_service_id"
    t.index ["package_id", "additional_service_id"], name: "idx_on_package_id_additional_service_id_74e0be02e7", unique: true
    t.index ["package_id"], name: "index_packages_additional_services_on_package_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plans_on_name"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "client_id", null: false
    t.integer "additional_service_id"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_subscriptions_on_additional_service_id"
    t.index ["client_id", "plan_id", "package_id", "additional_service_id"], name: "idx_on_client_id_plan_id_package_id_additional_serv_3cafdebaf4", unique: true
    t.index ["client_id"], name: "index_subscriptions_on_client_id"
    t.index ["package_id"], name: "index_subscriptions_on_package_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

  add_foreign_key "packages", "plans"
  add_foreign_key "packages_additional_services", "additional_services"
  add_foreign_key "packages_additional_services", "packages"
  add_foreign_key "subscriptions", "additional_services"
  add_foreign_key "subscriptions", "clients"
  add_foreign_key "subscriptions", "packages"
  add_foreign_key "subscriptions", "plans"
end
