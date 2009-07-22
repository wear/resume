class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.integer :sender
      t.integer :receiver
      t.string :sender_role
      t.string :receiver_role
      t.text :description
      t.integer :refer_type
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
