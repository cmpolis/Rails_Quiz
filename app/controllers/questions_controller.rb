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
      @question = @quiz.build_question
      render "#{@quiz.type.downcase}_new"
    end
  end

  def create
=begin
NOTE: moved question validation logic to each quiz type class
      allows for simpler controller logic and multiple question types

@question = Question.new(params[:question])  
    @question.valid?  # generate errors for questions

    right_answers = @question.answers.find_all { |ans| ans.right }    
    @question.errors.add_to_base "Must have exactly one right answer" \
           if right_answers.length != 1
    
    if @question.errors.empty?
      @question.save
      flash[:notice] = "Question added"
      redirect_to add_question_path(@question.quiz)
    else
      @quiz = @question.quiz
      render :new
    end
=end
    @quiz = Quiz.find(params[:question][:quiz_id])
    @question = @quiz.validate_question params
    if @question.errors.empty?
      @question.save
      flash[:notice] = "Question added"
      redirect_to add_question_path(@quiz)
    else
      #@question = @quiz.build_question
      render "#{@quiz.type.downcase}_new"
    end
  end

  def show
  end

end
