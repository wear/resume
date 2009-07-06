class Roles < ActiveRecord::Migration
  def self.up 
    create_table :roles, :force => true do |t|
      t.string :title
    end
    
    create_table "roles_users", :id => false, :force => true do |t|
      t.integer "role_id"
      t.integer   "user_id" 
    end  
    
    Role.reset_column_information
    user = Role.create(:title => 'user')
    superuser = Role.create(:title => 'superuser')
    
    admin = User.create(:login => 'admin', :email => 'admin@urc.com', :password => 'zzzzzz', :password_confirmation => 'zzzzzz')
    admin.roles << superuser
    admin.activate!
  end

  def self.down
    drop_table :roles_users
    drop_table :roles
  end
end
