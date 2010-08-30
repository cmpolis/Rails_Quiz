class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @quiz_entries = @user.quiz_entries
  end

  def new
    if signed_in?
      flash[:notice] = "Already registered"
      redirect_to root_url
    else
      @user = User.new params[:user]
      render :new
    end
  end

end
