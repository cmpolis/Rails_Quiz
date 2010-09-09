class QuizEntriesController < ApplicationController
  def new
    if !signed_in? 
      flash[:notice] = "Must be logged in to take quiz"
      redirect_to root_url
    else
      qe = QuizEntry.find_by_user_id_and_quiz_id(current_user.id, params[:id])
      if !qe.nil?
        flash[:notice] = "Already taken quiz"
        redirect_to quiz_results_path(qe.id)
      elsif params[:single_question]
        redirect_to take_quiz_question :id => params[:id], :question => 0
      else
        @quiz = Quiz.find(params[:id])
        @quiz_entry = QuizEntry.new

        @selected = [] # Used to persist selected answers
        render "#{@quiz.type.downcase}_new"
      end
    end
  end

  def create
=begin
    # QUIZ ENTRY VALIDATION MOVED TO QUIZ MODEL
    @quiz_entry = QuizEntry.new params[:quiz_entry]
    @quiz_entry.valid?        # Build errors
  
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
=end

    @quiz = Quiz.find(params[:quiz_entry][:quiz_id])
    @quiz_entry = @quiz.validate_entry params

    if @quiz_entry.errors.empty?
      @quiz_entry.save
      redirect_to quiz_results_path(@quiz_entry)
    else
      flash[:notice] = "Quiz submission unsuccesful"
  
      # remember which answers were selected
      @selected = params[:answers]
      #@quiz = @quiz_entry.quiz
      render "#{@quiz.type.downcase}_new"
    end
  end

=begin
  # DEPRICIATED, ALL QUIZZES DISPLAYED WITH ALL QUESTIONS
  def single_question
    if current_user.nil?
      flash[:notice] = "Must be logged in to tak quiz"
      redirect_to root_url
    else
      @quiz_entry = QuizEntry.find_by_user_id_and_quiz_id current_user.id, params[:id]
      @quiz_entry ||= QuizEntry.create :quiz_id => params[:id], :user_id => current_user.id
      @quiz = @quiz_entry.quiz
      @question = @quiz_entry.quiz.questions[params[:question].to_i - 1]
    end
  end
 
  # DEPRICIATED, ALL QUIZZES DISPLAYED WITH ALL QUESTIONS
  def proccess_question
    @question_submit = params[:question_submit] 
    
    if params[:answer].length != 1
      @question_submit.errors.add_to_base "Must select one answer"
      render :single_question
    else
      ae = AnswerEntry.new :answer_id => params[:answer][0], :quiz_entry_id => @question_submit["quiz_entry"]
      if ae.save
        flash[:notice] = "Answer submitted succesfully"
        
        if @question_submit["question"].to_i == ae.quiz_entry.quiz.questions.length
          redirect_to quiz_results_path(ae.quiz_entry)
        else
          redirect_to :action => "single_question", :id => ae.quiz_entry.quiz.id, :question => (@question_submit["question"].to_i + 1)
        end
      else
        flash[:notice] = "Answer unable to save"
        render :single_question
      end  
    end
      
  end
=end

  # Quiz results page
  def show
    @quiz_entry = QuizEntry.find params[:id]
    @quiz = @quiz_entry.quiz
  end

end
