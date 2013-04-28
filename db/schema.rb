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

ActiveRecord::Schema.define(:version => 20130424044649) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "author_name"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "tenant_id"
  end

  add_index "articles", ["tenant_id"], :name => "index_articles_on_tenant_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "tenants", :force => true do |t|
    t.string   "name",                    :limit => 100,                           :null => false
    t.string   "subdomain",               :limit => 32
    t.integer  "number_of_flats"
    t.boolean  "active",                                 :default => true
    t.string   "society_address_line1",   :limit => 200
    t.string   "society_address_line2",   :limit => 200
    t.string   "society_city",            :limit => 50,  :default => "MUMBAI"
    t.string   "society_pincode",         :limit => 20
    t.string   "society_state",           :limit => 50,  :default => "MAHARASTRA"
    t.string   "society_country",         :limit => 50,  :default => "INDIA"
    t.string   "govt_address_line1",      :limit => 200
    t.string   "govt_address_line2",      :limit => 200
    t.string   "govt_address_city",       :limit => 50,  :default => "MUMBAI"
    t.string   "govt_address_pincode",    :limit => 20
    t.string   "govt_address_plotnumber", :limit => 50
    t.string   "registration_number",     :limit => 50
    t.string   "govt_ward_number",        :limit => 50
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name",                   :limit => 100, :default => "Your Name"
    t.string   "state",                                 :default => "passive"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.integer  "tenant_id"
    t.date     "date_of_birth"
    t.string   "phone_number",           :limit => 20,  :default => "0000000000"
    t.string   "zip",                    :limit => 20,  :default => "400 000"
    t.text     "bio"
    t.string   "avatar_url"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["tenant_id"], :name => "index_users_on_tenant_id"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
