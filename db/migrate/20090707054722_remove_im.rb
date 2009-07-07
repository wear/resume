class RemoveIm < ActiveRecord::Migration
  def self.up
    remove_column :profiles, :im
  end

  def self.down
    add_column :profiles, :im, :string
  end
end
