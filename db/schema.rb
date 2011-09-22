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

ActiveRecord::Schema.define(:version => 20110918115229) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "bad_dates", :force => true do |t|
    t.date     "fujdate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buyers", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.integer  "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "ico"
    t.string   "dic"
    t.text     "info"
    t.text     "admin_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms_users", :id => false, :force => true do |t|
    t.integer "classroom_id"
    t.integer "user_id"
  end

  create_table "events", :force => true do |t|
    t.datetime "zaciatok"
    t.integer  "subject_id"
    t.integer  "classroom_id"
    t.integer  "user_id"
    t.string   "status"
    t.text     "popis"
    t.integer  "zastupujuci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "buyer_id"
    t.integer  "subject_id"
    t.string   "how_to_pay"
    t.integer  "persons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.string   "typ"
    t.text     "info"
    t.integer  "capacity"
    t.integer  "mins_per_hour"
    t.integer  "how_many_hours"
    t.text     "admin_note"
    t.integer  "user_id"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects_users", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.boolean  "active",                                :default => true
    t.string   "fname"
    t.string   "lname"
    t.string   "street"
    t.string   "city"
    t.integer  "zip"
    t.integer  "phone"
    t.string   "prac_pomer"
    t.text     "info"
    t.integer  "default_hour_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
