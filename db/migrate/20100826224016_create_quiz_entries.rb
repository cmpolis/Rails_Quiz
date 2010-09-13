class CreateQuizEntries < ActiveRecord::Migration
  def self.up
    create_table :quiz_entries do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.integer :correct

      t.timestamps
    end
    add_index :quiz_entries, [:user_id, :quiz_id]
  end

  def self.down
    remove_index :quiz_entries, [:user_id, :quiz_id]
    drop_table :quiz_entries
  end
end
