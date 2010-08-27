class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.integer :group_id
      t.boolean :private
      t.integer :creator_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
