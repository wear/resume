class ResetProfile < ActiveRecord::Migration
  def self.up
    remove_column :profiles, :user_id
    add_column :profiles, :resume_id, :integer
    rename_table :profiles, :personalinfos
    add_column :resumes, :lang, :string
  end

  def self.down
    remove_column :resumes, :lang
    rename_table :personalinfos, :profiles
    remove_column :profiles, :resume_id
    add_column :profiles, :user_id, :integer
  end
end
