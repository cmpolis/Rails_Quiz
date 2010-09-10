class CreateQuizEntries < ActiveRecord::Migration
  def self.up
    create_table :quiz_entries do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.integer :correct
 
      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_entries
  end
end
