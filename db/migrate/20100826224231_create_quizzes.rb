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
      t.integer :possible
      t.integer :times_taken
      t.integer :category_id

      t.timestamps
    end
    add_index :quizzes, [:creator_id, :category_id, :times_taken]
  end

  def self.down
    remove_index :quizzes, [:creator_id, :category_id, :times_taken]
    drop_table :quizzes
  end
end
