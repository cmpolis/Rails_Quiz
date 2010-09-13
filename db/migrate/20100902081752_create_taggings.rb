class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :quiz_id

      t.timestamps
    end
    add_index :taggings, [:tag_id, :quiz_id]
  end

  def self.down
    remove_index :taggings, [:tag_id, :quiz_id]
    drop_table :taggings
  end
end
