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

ActiveRecord::Schema.define(:version => 20120831064329) do

  create_table "agent_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "agents", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name"
    t.integer  "distributor_id"
    t.string   "contact_name"
    t.integer  "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "type_id"
  end

  create_table "cash_ins", :force => true do |t|
    t.integer  "item_id"
    t.integer  "agent_id"
    t.decimal  "cash_received", :precision => 10, :scale => 2
    t.decimal  "sales_value",   :precision => 10, :scale => 2
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "dsa_routes", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "route_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dsa_routes", ["agent_id", "route_id"], :name => "index_dsa_routes_on_agent_id_and_route_id", :unique => true
  add_index "dsa_routes", ["agent_id"], :name => "index_dsa_routes_on_agent_id", :unique => true
  add_index "dsa_routes", ["route_id"], :name => "index_dsa_routes_on_route_id", :unique => true

  create_table "employee_types", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "reports_to_type_id"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.integer  "employee_type_id"
    t.string   "contact_phone"
    t.integer  "reports_to_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"
  add_index "employees", ["username"], :name => "index_employees_on_username", :unique => true

  create_table "handsets", :force => true do |t|
    t.string   "brand"
    t.string   "serial"
    t.string   "battery_serial"
    t.string   "msisdn"
    t.integer  "agent_id"
    t.integer  "employee_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "handsets", ["battery_serial"], :name => "index_handsets_on_battery_serial", :unique => true
  add_index "handsets", ["msisdn"], :name => "index_handsets_on_msisdn", :unique => true
  add_index "handsets", ["serial"], :name => "index_handsets_on_serial", :unique => true

  create_table "item_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",        :precision => 10, :scale => 2
    t.decimal  "retail_price", :precision => 10, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "category_id"
  end

  create_table "location_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "parent_location_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "onhand_quantities", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "item_id"
    t.integer  "onhand_quantity"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "onhand_quantities", ["agent_id", "item_id"], :name => "index_onhand_quantities_on_agent_id_and_item_id", :unique => true

  create_table "outlets", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "route_id"
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "routes", :force => true do |t|
    t.integer  "location_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stock_issues", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "item_id"
    t.integer  "opening_quantity"
    t.integer  "issued_quantity"
    t.decimal  "unit_price",       :precision => 10, :scale => 2
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "employee_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
