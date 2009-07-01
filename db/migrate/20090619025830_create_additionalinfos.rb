class CreateAdditionalinfos < ActiveRecord::Migration
  def self.up
    create_table :additionalinfos do |t|
      t.integer :resume_id
      t.text :interests
      t.text :groups
      t.text :awards
      t.timestamps
    end
  end

  def self.down
    drop_table :additionalinfos
  end
end
