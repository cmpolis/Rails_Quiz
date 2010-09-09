class PagesController < ApplicationController
  
  def home
    @quizzes = Quiz.all(:limit => 10)
    @featured = Quiz.find_all_by_featured(true, :limit => 10)
  end

  def about
  end

  def admin
    
    # basic admin authentication for now...
    if user_is_admin?
      @quizzes = Quiz.all
      @users = User.all
      @groups = Group.all
      @quiz_entries = QuizEntry.all
      @category = Category.new
    else
      flash[:notice] = "You do not have admin privelages"
      redirect_to root_url
    end
  end

end
