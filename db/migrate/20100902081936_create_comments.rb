class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.string :text

      t.timestamps
    end
    add_index :comments, [:user_id, :quiz_id]
  end

  def self.down
    remove_index :comments, [:user_id, :quiz_id]
    drop_table :comments
  end
end
