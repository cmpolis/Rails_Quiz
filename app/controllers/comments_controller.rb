class CommentsController < ApplicationController

  def create
    if current_user.nil?
      flash[:notice] = "Must be logged in to comment"
    else
      @comment = Comment.new(params[:comment])
      @comment.user_id = current_user.id
      if @comment.save
        # flash[:notice] = "Comment added"
      else
        # flash[:notice] = "Unable to add comment, #{@comment.errors.full_messages}"
      end
    end
    # redirect_to request.referer
    respond_to do |format|
      format.html { redirect_to request.referer}
      format.js
    end
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "Comment deleted #{Comment.delete params[:id]}"
      redirect_to request.referer
    else
      flash[:notice] = "Must be admin to delete quiz"
    end 
  end

end
