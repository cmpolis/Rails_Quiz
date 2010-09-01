class CategoriesController < ApplicationController
  
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
  
    # clean up... Record.find(32) throws an exception if not found
   #             ...but Record.find_by_id(32) returns nil
    if params[:id].nil? || (@category = Category.find_by_id(params[:id])).nil?
      redirect_to root_url
    else
      render :show
    end
  end

  def update
  end

end
