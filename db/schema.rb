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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130516201505) do

  create_table "breads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menus", :force => true do |t|
    t.integer  "bread_id"
    t.decimal  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "menus", ["bread_id"], :name => "index_menus_on_bread_id"

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "bread_id"
    t.decimal  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_details", ["bread_id"], :name => "index_order_details_on_bread_id"
  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"

  create_table "orders", :force => true do |t|
    t.string   "customer_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "note"
  end

end
