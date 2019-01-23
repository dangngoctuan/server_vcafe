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

ActiveRecord::Schema.define(version: 20190123085658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_tables", force: :cascade do |t|
    t.integer "ordering", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "active", default: false
    t.index ["user_id"], name: "index_coffee_tables_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "beverages"
    t.integer "price", default: 0
    t.integer "ordering", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coffee_table_id"
    t.bigint "menu_id"
    t.index ["coffee_table_id"], name: "index_orders_on_coffee_table_id"
    t.index ["menu_id"], name: "index_orders_on_menu_id"
  end

  create_table "total_bills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "coffee_table_id"
    t.integer "total", default: 0
    t.index ["coffee_table_id"], name: "index_total_bills_on_coffee_table_id"
    t.index ["user_id"], name: "index_total_bills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
