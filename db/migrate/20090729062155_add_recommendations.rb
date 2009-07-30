class AddRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations, :force => true do |t|
      t.integer :sender_id, :receiver_id 
      t.boolean :visible,:default => false  
      t.string :recommendable_type
      t.integer :recommandable_id
      t.text :desc
      t.string :sender_role
      t.integer :refer_type
      t.timestamps
    end                     
    add_column :messages, :req, :string
    
  end

  def self.down
    remove_column :messages, :req
    drop_table :recommendations    
  end
end
