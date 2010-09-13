class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :text
      t.boolean :right
      t.integer :question_id

      t.timestamps
    end
    add_index :answers, :question_id
  end

  def self.down
    remove_index :answers, :question_id
    drop_table :answers
  end
end
