class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :type
      #t.integer :group_id
      #t.boolean :private
      t.boolean :published
      t.integer :creator_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
