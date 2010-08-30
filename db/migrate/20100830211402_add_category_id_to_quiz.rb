class AddCategoryIdToQuiz < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :category_id, :integer
  end

  def self.down
    remove_column :quizzes, :category_id
  end
end
