class CreateAnswerEntries < ActiveRecord::Migration
  def self.up
    create_table :answer_entries do |t|
      t.integer :quiz_entry_id
      t.integer :answer_id

      t.timestamps
    end
    add_index :answer_entries, [:quiz_entry_id, :answer_id]
  end

  def self.down
    remove_index :answer_entries, [:quiz_entry_id, :answer_id]
    drop_table :answer_entries
  end
end
