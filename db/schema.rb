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

ActiveRecord::Schema.define(:version => 20130706001559) do

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.integer  "route_id"
    t.datetime "start_time"
    t.integer  "pace"
    t.string   "url_key"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "location_settings", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "notification_frequency"
    t.string   "notification_method"
    t.integer  "pace_min"
    t.integer  "pace_max"
    t.integer  "distance_min"
    t.integer  "distance_max"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "routes", :force => true do |t|
    t.string "name"
    t.float  "distance"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "cellphone"
    t.string   "gravatar_hash"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "waypoints", :force => true do |t|
    t.integer "route_id"
    t.integer "position"
    t.float   "latitude"
    t.float   "longitude"
  end

end
