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

ActiveRecord::Schema.define(:version => 20090729062155) do

  create_table "additionalinfos", :force => true do |t|
    t.integer  "resume_id"
    t.text     "interests"
    t.text     "groups"
    t.text     "awards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asserts", :force => true do |t|
    t.string   "filename"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.integer  "size"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.string   "thumbnail"
    t.integer  "parent_id"
  end

  create_table "comatose_page_versions", :force => true do |t|
    t.integer  "comatose_page_id"
    t.integer  "version"
    t.integer  "parent_id"
    t.text     "full_path"
    t.string   "title"
    t.string   "slug"
    t.string   "keywords"
    t.text     "body"
    t.string   "filter_type",      :limit => 25, :default => "Textile"
    t.string   "author"
    t.integer  "position",                       :default => 0
    t.datetime "updated_on"
    t.datetime "created_on"
  end

  create_table "comatose_pages", :force => true do |t|
    t.integer  "parent_id"
    t.text     "full_path"
    t.string   "title"
    t.string   "slug"
    t.string   "keywords"
    t.text     "body"
    t.string   "filter_type", :limit => 25, :default => "Textile"
    t.string   "author"
    t.integer  "position",                  :default => 0
    t.integer  "version"
    t.datetime "updated_on"
    t.datetime "created_on"
  end

  create_table "educations", :force => true do |t|
    t.integer  "resume_id"
    t.string   "name"
    t.string   "degree"
    t.string   "field"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "req"
  end

  create_table "positions", :force => true do |t|
    t.integer  "resume_id"
    t.string   "title"
    t.string   "company"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
  end

  create_table "posters", :force => true do |t|
    t.string   "position"
    t.string   "email"
    t.text     "content"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "email"
    t.datetime "birthday"
    t.boolean  "marital_status"
    t.string   "sex"
    t.string   "hometwon"
    t.string   "hukou"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "visible",            :default => false
    t.string   "recommendable_type"
    t.integer  "recommandable_id"
    t.text     "desc"
    t.string   "sender_role"
    t.integer  "refer_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "salt"
    t.string   "usage"
    t.integer  "type"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "summaries", :force => true do |t|
    t.integer  "resume_id"
    t.text     "content"
    t.text     "specialties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "invitation_code"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
