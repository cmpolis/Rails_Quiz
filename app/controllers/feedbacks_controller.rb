class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
    @feedback.email = current_user.email if logged_in?
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.user_id = current_user.id
    @feedback.status ||= 1
    if @feedback.save
      flash[:notice] = "Entry saved, Thank you for your feedback!"
      redirect_to root_url
    else
      flash[:notice] = "Errors with feedback ticket"
      render :new
    end
  end

  def index
  end

end
