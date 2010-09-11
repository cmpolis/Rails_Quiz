class LikesController < ApplicationController

  def create
    if params[:id].blank?
      flash[:notice] = "Must have a quiz id to like"
    elsif current_user.nil?
      flash[:notice] = "Must be logged in to like a quiz"
      redirect_to quiz_path(params[:id])
    elsif !Like.find_by_user_id_and_quiz_id(current_user.id, params[:id]).nil?
      flash[:notice] = "Can only like a quiz once"
    else
      Like.create :quiz_id => params[:id], :user_id => current_user.id
      flash[:notice] = "Quiz succesfully liked"
    end
    redirect_to request.referer
  end
end
