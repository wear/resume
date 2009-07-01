class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t| 
      t.integer :resume_id
      t.string :name
      t.string :degree
      t.string :field
      t.datetime :start_at
      t.datetime :end_at
      t.text :description

    end
  end

  def self.down
    drop_table :educations
  end
end
