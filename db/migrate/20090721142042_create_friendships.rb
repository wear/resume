class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :friend_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
    add_column :users, :invitation_code, :string
    
    User.find(:all).each{|u| u.update_attribute(:invitation_code,User.generate_new_password(12))}
  end

  def self.down
   remove_column :users, :invitation_code
   drop_table :friendships
  end
end
