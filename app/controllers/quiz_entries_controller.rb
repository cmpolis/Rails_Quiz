class QuizEntriesController < ApplicationController
  def new
    if current_user.nil? 
      flash[:notice] = "Must be logged in to take quiz"
      redirect_to root_url
    elsif params[:single_question]
      redirect_to take_quiz_question :id => params[:id], :question => 0
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
      redirect_to quiz_results_path(@quiz_entry)
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
 
  def proccess_question

    #TODO: CLEAN THIS UP!!

    @question_submit = params[:question_submit] # contains quiz_entry(id), question
    # in params[] => answer[], question_submit, question
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

  # Quiz results page
  def show
    @quiz_entry = QuizEntry.find params[:id]
    @quiz = @quiz_entry.quiz
    @questions = @quiz.questions
    @answers = @quiz_entry.answers
    @right_answers = @answers.find_all_by_right true
  end

end
