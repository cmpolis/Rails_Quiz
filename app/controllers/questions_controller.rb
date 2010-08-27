class QuestionsController < ApplicationController
  
  def new
    if Quiz.find(params[:id]).nil?
      redirect_to root_url
      flash[:notice] = "Invalid quiz id"
    elsif !current_user.nil? or Quiz.find(params[:id]).creator_id != current_user.id
      redirect_to root_url
      flash[:notice] = "Must be quiz creator to add a question"
    else
      render :new
    end
  end

  def show
  end

end
