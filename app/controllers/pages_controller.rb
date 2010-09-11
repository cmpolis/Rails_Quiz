class PagesController < ApplicationController
  
  def home
    # @newest = Quiz.find_all_by_published(true, :limit => 10, :order => 'created_at')
    # @popular = Quiz.find_all_by_published(true, :limit => 10, :order => 'times_taken DESC')

    @newest = Quiz.paginate :page => params[:newest_page], :order => 'created_at'
    @popular = Quiz.paginate :page => params[:popular_page], :order => 'times_taken DESC'

    respond_to do |format|
      format.html
      format.js {
        render :update do |page|
          # 'page.replace' will replace full "results" block...works for this example
          # 'page.replace_html' will replace "results" inner html...useful elsewhere
          page.replace 'newest_results', :partial => 'newest_results'
          page.replace 'popular_results', :partial => 'popular_results'
        end
      }
    end
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
