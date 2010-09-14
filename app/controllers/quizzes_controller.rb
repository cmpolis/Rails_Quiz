class QuizzesController < ApplicationController
  def new
    if current_user.nil?
      flash[:notice] = "Must be logged in to make a quiz"
      redirect_to root_url
    else
      render :new
      @quiz = Quiz.new
      @groups = Group.find_all_by_admin_id current_user.id
    end
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    @quiz.creator_id = current_user.id
    @quiz.featured ||= false
    @quiz.description ||= ""
    @quiz.published = false
    @quiz.times_taken = 0
    
    # 'type' is a reserved word in ruby, but neccesary for STI...
    @quiz[:type] = params[:kind]
     
    if @quiz.save
      Tag.parse(@quiz.id, params[:tags]) unless params[:tags].blank?
      redirect_to add_question_path(@quiz)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def random
    # assumes all quizzes are valid, will need to be updatd!
    redirect_to take_quiz_path(Quiz.find_by_published(true, :order => "rand()"))
  end

  def search
    if params[:query].empty? || params[:query].length < 3
      flash[:notice] = "Invalid search query"
      redirect_to request.referer
    else
      @quizzes = Quiz.search(params[:query]).paginate :per_page => 10, :page => params[:page]

      respond_to do |format|
        format.html
        format.js {
          render :update do |page|
            # 'page.replace' will replace full "results" block...works for this example
            # 'page.replace_html' will replace "results" inner html...useful elsewhere
            page.replace 'search_results', :partial => 'search_results'
          end
        }
        end
    end
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "Quiz deleted #{Quiz.delete params[:id]}"
      redirect_to admin_path
    else
      flash[:notice] = "Must be admin to delete quiz"
    end 
  end

end
