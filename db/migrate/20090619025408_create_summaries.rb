class CreateSummaries < ActiveRecord::Migration
  def self.up
    create_table :summaries do |t|
      t.integer :resume_id
      t.text :content
      t.text :specialties
      t.timestamps
    end
  end

  def self.down
    drop_table :summaries
  end
end
