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
  end

  def show
  end

end
