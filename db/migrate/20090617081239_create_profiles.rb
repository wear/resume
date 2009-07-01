class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :resume_id
      t.string :name
      t.string :mobile
      t.string :address
      t.string :email
      t.string :im
      t.datetime :birthday
      t.boolean :marital_status
      t.string :sex
      t.string :hometwon
      t.string :hukou
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
