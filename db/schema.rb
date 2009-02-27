# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090227170419) do

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approved",       :limit => 1, :default => 0, :null => false
    t.integer  "bounces",                     :default => 0
    t.text     "feed_data"
    t.string   "feed_data_type"
    t.text     "http_headers"
    t.datetime "last_retrieved"
    t.string   "feed_type"
  end

  add_index "feeds", ["author"], :name => "author"

  create_table "posts", :force => true do |t|
    t.integer  "feed_id"
    t.string   "url"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "guid"
    t.string   "comment_url"
  end

  add_index "posts", ["created_at"], :name => "sorting"
  add_index "posts", ["feed_id", "url"], :name => "feed_id"
  add_index "posts", ["title", "body"], :name => "text"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "sessions_session_id_index"

  create_table "sidebar_configs", :force => true do |t|
    t.string  "controller"
    t.integer "active_position"
    t.text    "active_config"
    t.integer "staged_position"
    t.text    "staged_config"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tags_posts", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "post_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["token"], :name => "index_users_on_token"

end
