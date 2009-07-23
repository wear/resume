class MoreResumeItem < ActiveRecord::Migration
  def self.up       
    add_column :resumes, :usage, :string
    add_column :resumes, :type, :integer
  end

  def self.down
    remove_column :resumes, :usage
    remove_column :resumes, :type
  end
end
