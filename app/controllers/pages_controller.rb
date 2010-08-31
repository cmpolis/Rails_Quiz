class PagesController < ApplicationController
  
  def home
    @quizzes = Quiz.find_all_by_private false 
  end

  def about
  end

  def admin
    
    # basic admin authentication for now...
    if current_user.id == 1
      @quizzes = Quiz.all
      @users = User.all
      @groups = Group.all
    else
      flash[:notice] = "You do not have admin privelages"
      redirect_to root_url
    end
  end

end
