class AddUserResume < ActiveRecord::Migration
  def self.up
    add_column :resumes, :user_id, :integer
    add_column :profiles, :user_id, :integer
  end

  def self.down
    remove_column :profiles, :user_id
    remove_column :resumes, :user_id
  end
end
