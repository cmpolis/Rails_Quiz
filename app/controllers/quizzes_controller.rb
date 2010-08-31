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
    @quiz.private ||= false
    @quiz.featured ||= false
    if @quiz.save
      redirect_to add_question_path(@quiz)
    else
      render :new
    end
  end

  def show
  end

  def edit
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
