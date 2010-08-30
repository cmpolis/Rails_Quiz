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
      redirect_to :controller => "questions", :action => "new", :id => @quiz.id
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

end
