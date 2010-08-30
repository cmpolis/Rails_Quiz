class AddFeaturedToQuiz < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :featured, :boolean
  end

  def self.down
    remove_column :quizzes, :featured
  end
end
