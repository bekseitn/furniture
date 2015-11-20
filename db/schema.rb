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

ActiveRecord::Schema.define(version: 20151120051517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "ordering_id"
    t.integer "unit_price"
    t.integer "quantity"
    t.integer "total_price"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["ordering_id"], name: "index_order_items_on_ordering_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "orderings", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "order_id"
    t.integer  "order_status_id"
    t.string   "address"
    t.string   "name"
    t.string   "phone"
    t.integer  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orderings", ["city_id"], name: "index_orderings_on_city_id", using: :btree
  add_index "orderings", ["order_id"], name: "index_orderings_on_order_id", using: :btree
  add_index "orderings", ["order_status_id"], name: "index_orderings_on_order_status_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  add_foreign_key "order_items", "orderings"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orderings", "cities"
  add_foreign_key "orderings", "order_statuses"
  add_foreign_key "orderings", "orders"
  add_foreign_key "products", "categories"
end
