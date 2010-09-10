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
    if params[:query].empty?
      flash[:notice] = "Invalid search query"
      redirect_to request.referer
    else
      @quizzes = Quiz.search params[:query]
    end
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "Quiz deleted #{Quiz.delete params[:id]}"
      redirect_to request.referer
    else
      flash[:notice] = "Must be admin to delete quiz"
    end 
  end

end
