class CreateAnswerEntries < ActiveRecord::Migration
  def self.up
    create_table :answer_entries do |t|
      t.integer :QuizEntry_id
      t.integer :answer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_entries
  end
end
