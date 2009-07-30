class CreatePosters < ActiveRecord::Migration
  def self.up
     create_table :posters do |t|
      t.string :position
      t.string :email
      t.text :content
      t.integer :resume_id

      t.timestamps
    end  
    remove_column :profiles, :resume_id

  end

  def self.down
    add_column :profiles, :resume_id, :integer
    drop_table :posters
  end
end
