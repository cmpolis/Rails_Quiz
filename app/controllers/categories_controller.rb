class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end  

  def create
    if user_is_admin?
      @category = Category.new params[:category]
      flash[:notice] = @category.save ? "#{@category.title} category saved" : "Unable to create category" 
    else
      flas[:notice] = "Must be admin to create a category"
    end
    redirect_to request.referer
  end

  def show
   @category = Category.find_by_id params[:id]
   if @category.nil?
      redirect_to root_url
    else
      render :show
    end
  end

  def update
  end

end
