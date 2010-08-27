class QuizzesController < ApplicationController
  def new
    if current_user.nil?
      flash[:notice] = "Must be logged in to make a quiz"
      redirect_to root_url
    else
    end
  end

  def show
  end

  def edit
  end

end
