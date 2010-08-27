class PagesController < ApplicationController
  
  def home
    @quizzes = Quiz.find_all_by_private false 
  end

  def about
  end

end
