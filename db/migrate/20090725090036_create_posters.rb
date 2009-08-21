class CreatePosters < ActiveRecord::Migration
  def self.up
     create_table :posters do |t|
      t.string :position
      t.string :email
      t.text :content
      t.integer :resume_id

      t.timestamps
    end  

  end

  def self.down
    drop_table :posters
  end
end
