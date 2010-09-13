class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :quiz_id
      t.string :text

      t.timestamps
    end
    add_index :questions, :quiz_id
  end

  def self.down
    remove_index :questions, :quiz_id
    drop_table :questions
  end
end
