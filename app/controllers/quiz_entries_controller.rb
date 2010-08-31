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
       
      #if re-rendered because of error, remember which answers are selected
      @selected = []
    end
  end

  def create
    @quiz_entry = QuizEntry.new params[:quiz_entry]
   
    # build errors for @quiz_entry
    @quiz_entry.valid?
  
    params[:answers] ||= []   
    params[:answers].each do |answer|
      @quiz_entry.answer_entries.build :answer_id => answer
    end

    @quiz_entry.quiz.questions.each do |question|
      if question.answers.find_all_by_id(params[:answers]).length == 0
        @quiz_entry.errors.add_to_base "No answer for: #{question.text}"
      elsif question.answers.find_all_by_id(params[:answers]).length > 1
        @quiz_entry.errors.add_to_base "More than one answer for: #{question.text}"
      end
    end

    if @quiz_entry.errors.empty?
      @quiz_entry.save
      redirect_to :controller => "quiz_entries", :action => "show", :id => @quiz_entry.id
    else
      flash[:notice] = "Quiz submission unsuccesful"
      @user = current_user
  
      # remember which answers were selected
      @selected = params[:answers]
      @quiz = @quiz_entry.quiz
      @questions = @quiz.questions
      render :new
    end
  end

  # Quiz results page
  def show
    @quiz_entry = QuizEntry.find params[:id]
    @quiz = @quiz_entry.quiz
    @questions = @quiz.questions
    @answers = @quiz_entry.answers
    @right_answers = @answers.find_all_by_right true
  end

end
