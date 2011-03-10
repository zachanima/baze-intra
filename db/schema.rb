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

ActiveRecord::Schema.define(:version => 20110310170323) do

  create_table "orders", :force => true do |t|
    t.string   "created_by"
    t.string   "good"
    t.string   "size"
    t.string   "color"
    t.string   "quantity"
    t.string   "case_number"
    t.date     "ordered_at"
    t.string   "ordered_by"
    t.string   "remarks"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["supplier_id"], :name => "index_orders_on_supplier_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "customer_id"
    t.text     "contact",       :limit => 255
    t.string   "email"
    t.text     "return_policy", :limit => 255
    t.text     "remarks",       :limit => 255
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
