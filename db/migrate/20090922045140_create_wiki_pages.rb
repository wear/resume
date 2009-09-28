class CreateWikiPages < ActiveRecord::Migration
  def self.up
    create_table :wiki_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_pages
  end
end
