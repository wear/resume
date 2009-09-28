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

ActiveRecord::Schema.define(:version => 20090922045035) do

  create_table "additionalinfos", :force => true do |t|
    t.integer  "resume_id"
    t.text     "interests"
    t.text     "groups"
    t.text     "awards"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  add_index "additionalinfos", ["resume_id"], :name => "index_additionalinfos_resume_id"    

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
  
  add_index "asserts", ["attachable_id", "attachable_type"], :name => "index_asserts_on_attachable_id_and_attachable_type"

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

  add_index "educations", ["resume_id"], :name => "index_educations_resume_id" 

  create_table "friendships", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  add_index "friendships", ["friend_id"], :name => "index_friendships_friend_id" 
  add_index "friendships", ["user_id"], :name => "index_friendships_user_id"   
    
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
    t.string   "req_type"
    t.integer  "req_id"
  end    
  
  add_index "messages", ["sender_id"], :name => "index_messages_sender_id"  
  add_index "messages", ["recipient_id"], :name => "index_messages_recipient_id"      

  create_table "personalinfos", :force => true do |t|
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
    t.integer  "resume_id"
  end 
  

  create_table "positions", :force => true do |t|
    t.integer  "resume_id"
    t.string   "title"
    t.string   "company"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
  end       
  
  add_index "positions", ["resume_id"], :name => "index_positions_resume_id"  

  create_table "posters", :force => true do |t|
    t.string   "position"
    t.string   "email"
    t.text     "content"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "visible",     :default => false
    t.text     "desc"
    t.string   "sender_role"
    t.integer  "refer_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end                                                                   
  
  add_index "recommendations", ["sender_id"], :name => "index_recommendations_sender_id"    
  add_index "recommendations", ["receiver_id"], :name => "index_recommendations_receiver_id" 
  
  create_table "resumes", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "salt"
    t.string   "usage"
    t.integer  "type" 
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "email"
    t.datetime "birthday"
    t.boolean  "marital_status"
    t.string   "sex"
    t.string   "hometwon"
    t.string   "hukou"
    t.string   "lang",       :limit => 11, :default => "cn" 
  end          
  
  add_index "resumes", ["user_id"], :name => "index_resumes_user_id"  

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
  
  add_index "summaries", ["resume_id"], :name => "index_summaries_resume_id" 

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
    
  create_table "invitations", :force => true do |t|
    t.string   "email_addresses"
    t.string   "message"
    t.string   "user_id"
    t.datetime "created_at"
  end      
  
  add_index "invitations", ["user_id"], :name => "index_invitations_user_id" 
  
  create_table "groups", :force => true do |t|
    t.string   "title"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain"
    t.text     "description"
    t.integer  "access"
    t.integer  "member_count", :default => 0
    t.string   "logo"
    t.integer  "appearance"
    t.boolean  "member_auth",  :default => false
    t.boolean  "content_auth", :default => false
  end    
  
  create_table "memberships", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "group_id",        :null => false
    t.datetime "accepted_at"
    t.boolean  "admin_role",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pending_message"
  end
  
  add_index "memberships", ["group_id"], :name => "index_memberships_group_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_user_id" 
  add_index "invitations", ["user_id"], :name => "index_invitations_user_id"  
  
  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "action",     :limit => 50
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.integer  "group_id"
  end
  add_index "activities", ["user_id"], :name => "activities_user_id"
  add_index "activities", ["group_id"], :name => "activities_group_id" 
  add_index "activities", ["item_id", "item_type"], :name => "index_activities_item_id_and_item_type"                
  
  create_table "wiki_content_versions", :force => true do |t|
    t.integer  "wiki_content_id",                              :null => false
    t.integer  "page_id",                                      :null => false
    t.integer  "author_id"
    t.binary   "data"
    t.string   "compression",     :limit => 6, :default => ""
    t.string   "comments",                     :default => ""
    t.datetime "updated_on",                                   :null => false
    t.integer  "version",                                      :null => false
  end

  add_index "wiki_content_versions", ["wiki_content_id"], :name => "wiki_content_versions_wcid"

  create_table "wiki_contents", :force => true do |t|
    t.integer  "page_id",                    :null => false
    t.integer  "author_id"
    t.text     "text"
    t.string   "comments",   :default => ""
    t.datetime "updated_on",                 :null => false
    t.integer  "version",                    :null => false
  end

  add_index "wiki_contents", ["page_id"], :name => "wiki_contents_page_id"

  create_table "wiki_pages", :force => true do |t|
    t.integer  "wiki_id",                       :null => false
    t.string   "title",                         :null => false
    t.datetime "created_on",                    :null => false
    t.boolean  "protected",  :default => false, :null => false
    t.integer  "parent_id"
  end

  add_index "wiki_pages", ["wiki_id", "title"], :name => "wiki_pages_wiki_id_title"

  create_table "wiki_redirects", :force => true do |t|
    t.integer  "wiki_id",      :null => false
    t.string   "title"
    t.string   "redirects_to"
    t.datetime "created_on",   :null => false
  end

  add_index "wiki_redirects", ["wiki_id", "title"], :name => "wiki_redirects_wiki_id_title"

  create_table "wikis", :force => true do |t|
    t.integer "group_id",                  :null => false
    t.string  "start_page",                :null => false
    t.integer "status",     :default => 1, :null => false
  end

  add_index "wikis", ["group_id"], :name => "wikis_group_id"

end
