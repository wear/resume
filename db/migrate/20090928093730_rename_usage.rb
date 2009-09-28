class RenameUsage < ActiveRecord::Migration
  def self.up
    rename_column :resumes, :usage, :current
  end

  def self.down
    rename_column :resumes, :current, :usage
  end
end
