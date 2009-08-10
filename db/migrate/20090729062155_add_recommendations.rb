class AddRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations, :force => true do |t|
      t.integer :sender_id, :receiver_id 
      t.boolean :visible,:default => false  
      t.text :desc
      t.string :sender_role
      t.string :receiver_role
      t.string :refer_type
      t.timestamps
    end                     
    add_column :messages, :req_type, :string
    add_column :messages, :req_id, :integer
    
  end

  def self.down
    remove_column :messages, :req_id
    remove_column :messages, :req_type
    drop_table :recommendations    
  end
end
