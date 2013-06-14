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

ActiveRecord::Schema.define(:version => 20130614050702) do

  create_table "os_images", :force => true do |t|
    t.string   "system"
    t.string   "file"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "ip"
    t.string   "key"
    t.text     "hardware"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "snapshots", :force => true do |t|
    t.string   "file"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "fname"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "virtual_machines", :force => true do |t|
    t.text     "description"
    t.string   "name"
    t.string   "macaddr"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image"
    t.string   "connection_s"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "vmconfig_id"
    t.string   "uuid"
    t.integer  "server_id"
    t.string   "filename"
  end

  create_table "vm_configs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "config"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vmconfigs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "memory"
    t.integer  "vcpu"
  end

end
