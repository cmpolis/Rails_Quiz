class QuizEntriesController < ApplicationController
  def new
    if current_user.nil? 
      flash[:notice] = "Must be logged in to take quiz"
      redirect_to root_url
    else
      @quiz = Quiz.find(params[:id])
      @questions = @quiz.questions # Filter here as neccesary
      @quiz_entry = QuizEntry.new
      @user = current_user
    end
  end

  def create
    @quiz_entry = QuizEntry.new params[:quiz_entry]
    
    # QEntry needs an ID for answer_entries to have an ID pass validations
    #   save QEntry first (w/o answers), then add answers, validate answers
    @quiz_entry.save if @quiz_entry.valid?
    params[:answers].each do |answer|
      @quiz_entry.answer_entries.build :answer_id => answer
    end
    # check for:
    #   multiple selections on one question
    #   no answer for a question
    #   etc...
 
    if @quiz_entry.save
      redirect_to :controller => "quiz_entries", :action => "show", :id => @quiz_entry.id
    else
      flash[:notice] = "Quiz submission unsuccesful"
      @user = current_user
      @quiz = @quiz_entry.quiz
      @questions = @quiz.questions
      render :new
    end
  end

  def show
  end

end
