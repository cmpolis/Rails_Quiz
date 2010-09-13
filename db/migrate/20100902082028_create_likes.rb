class CreateLikes < ActiveRecord::Migration
  def self.up
    create_table :likes do |t|
      t.integer :user_id
      t.integer :quiz_id

      t.timestamps
    end
    add_index :likes, [:user_id, :quiz_id]
  end

  def self.down
    remove_index :likes, [:user_id, :quiz_id]
    drop_table :likes
  end
end
