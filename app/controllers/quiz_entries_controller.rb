class QuizEntriesController < ApplicationController
  def new
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions # Filter here as neccesary
    @quiz_entry = QuizEntry.new
  end

  def create
        
  end

  def show
  end

end
