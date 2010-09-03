class CommentsController < ApplicationController

  def create
    if current_user.nil?
      flash[:notice] = "Must be logged in to comment"
    else
      @comment = Comment.new(params[:comment])
      @comment.user_id = current_user.id
      if @comment.save
        flash[:notice] = "Comment added"
      else
        flash[:notice] = "Unable to add comment, #{@comment.errors.full_messages}"
      end
    end
    redirect_to request.referer
  end

end
