class TagsController < ApplicationController
  
  def show
    @tag = Tag.find(params[:id])
    @quizzes = @tag.quizzes :conditions => ['published=true']
  end

end
