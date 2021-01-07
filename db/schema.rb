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

ActiveRecord::Schema.define(version: 2021_01_07_143714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.float "total_value"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_assets_on_user_id"
  end

  create_table "bonds", force: :cascade do |t|
    t.integer "period"
    t.string "terms"
    t.date "start_date"
    t.date "end_date"
    t.float "interest_rate"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "asset_id"
    t.index ["asset_id"], name: "index_bonds_on_asset_id"
  end

  create_table "cash_deposits", force: :cascade do |t|
    t.bigint "cash_id", null: false
    t.float "amount"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_id"], name: "index_cash_deposits_on_cash_id"
  end

  create_table "cash_transactions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "amount"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "details"
    t.index ["user_id"], name: "index_cash_transactions_on_user_id"
  end

  create_table "cash_withdrawals", force: :cascade do |t|
    t.float "amount"
    t.string "reason"
    t.bigint "cash_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_id"], name: "index_cash_withdrawals_on_cash_id"
  end

  create_table "cashes", force: :cascade do |t|
    t.float "amount"
    t.bigint "asset_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "sources"
    t.index ["asset_id"], name: "index_cashes_on_asset_id"
  end

  create_table "properties", force: :cascade do |t|
    t.float "value"
    t.text "description"
    t.string "location"
    t.bigint "asset_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_properties_on_asset_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "instrument"
    t.float "position"
    t.float "average_price"
    t.float "cost_basis"
    t.bigint "asset_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_stocks_on_asset_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "occupation"
    t.integer "age", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assets", "users"
  add_foreign_key "cash_deposits", "cashes"
  add_foreign_key "cash_transactions", "users"
  add_foreign_key "cash_withdrawals", "cashes"
  add_foreign_key "cashes", "assets"
  add_foreign_key "properties", "assets"
  add_foreign_key "stocks", "assets"
end
