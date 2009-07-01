class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.integer :resume_id  
      t.string :title
      t.string :company
      t.datetime :start_at
      t.datetime :end_at
      t.text :description

    end
  end

  def self.down
    drop_table :positions
  end
end
