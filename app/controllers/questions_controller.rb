class QuestionsController < ApplicationController
  
  def new
    @quiz = Quiz.find(params[:id])
    if @quiz.nil?
      redirect_to root_url
      flash[:notice] = "Invalid quiz id"
    elsif @quiz.published
      flash[:notice] = "Quiz is already published"
    elsif current_user.nil? or @quiz.creator_id != current_user.id
      redirect_to root_url
      flash[:notice] = "Must be quiz creator to add a question"
    else
      @question = @quiz.build_question
      render "#{@quiz.type.downcase}_new"
    end
  end

  def create
    @quiz = Quiz.find(params[:question][:quiz_id])
    @question = @quiz.validate_question params
    if params[:commit] == "Publish Quiz"
      if @question.text.blank? and !@quiz.questions.empty?
        flash[:notice] = "Quiz published"
        @quiz.published = true
        @quiz.save
        redirect_to take_quiz_path(@quiz)
      elsif @quiz.questions.empty?
        flash[:notice] = "Cannot publish empty quiz"
        render "#{@quiz.type.downcase}_new"
      elsif @question.errors.empty?
        @question.save
        flash[:notice] = "Question added, quiz published"
        @quiz.published = true
        @quiz.save
      else
        render "#{@quiz.type.downcase}_new"
      end
    elsif @question.errors.empty?
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
