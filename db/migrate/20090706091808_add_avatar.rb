class AddAvatar < ActiveRecord::Migration
  def self.up
      create_table :asserts do |t|
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
  end

  def self.down
    drop_table :asserts
  end
 
end
