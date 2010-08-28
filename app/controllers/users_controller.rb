class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @quiz_entries = @user.quiz_entries
  end

end
