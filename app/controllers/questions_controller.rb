class QuestionsController < ApplicationController
  
  def new
    @quiz = Quiz.find(params[:id])
    if @quiz.nil?
      redirect_to root_url
      flash[:notice] = "Invalid quiz id"
    elsif current_user.nil? or @quiz.creator_id != current_user.id
      redirect_to root_url
      flash[:notice] = "Must be quiz creator to add a question"
    else
      @question = @quiz.questions.build
      (1..4).each { @question.answers.build }
    end
  end

  def create
    @question = Question.new(params[:question])
    
    # Get next available id for question, assign it into new answers
    @question.transaction do 
      @question.id = (Question.last.nil? ? 1 : Question.last.id + 1)
      @question.answers.each { |ans| ans.question_id = @question.id }
      
      # Try to save in transaction, but proccess outside of it to free db
      @save_success = @question.save 
    end
    if @save_success
      flash[:notice] = "Question added"
      redirect_to :action => "new", :id => @question.quiz_id
    else
      @quiz = @question.quiz
      render :new
      flash[:notice] = @question.errors.full_messages
    end
  end

  def show
  end

end