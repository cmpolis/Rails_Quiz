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
        @quiz = Quiz.find(params[:id], :include => [{:questions => :answers}, :tags])
        if !@quiz.published
          flash[:notice] = "Quiz is not published yet"
          redirect_to root_url
        else
          @quiz_entry = QuizEntry.new

          @selected = [] # Used to persist selected answers
          render "#{@quiz.type.downcase}_new"
        end
      end
    end
  end

  def create
    @quiz = Quiz.find(params[:quiz_entry][:quiz_id])
    @quiz_entry = @quiz.validate_entry params

    if @quiz_entry.errors.empty?
      @quiz_entry.save
      @quiz_entry.grade_quiz
      redirect_to quiz_results_path(@quiz_entry)
    elsif params[:answers].empty?
      flash[:notice] = "Must submit answers"
      redirect_to request.referer
    else
      flash[:notice] = "Quiz submission unsuccesful"


      # remember which answers were selected
      @selected = params[:answers]
      #@quiz = @quiz_entry.quiz
      render "#{@quiz.type.downcase}_new"
    end
  end

  # Quiz results page
  def show
    @quiz_entry = QuizEntry.find(params[:id], :include => { :quiz => [{:questions => :answers}, :tags]})
    @quiz = @quiz_entry.quiz
  end

end
