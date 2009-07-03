class Salt < ActiveRecord::Migration
  def self.up
    add_column :resumes, :salt, :string
  end

  def self.down
    remove_column :resumes, :salt
  end
end
