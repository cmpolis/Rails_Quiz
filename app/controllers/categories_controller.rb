class CategoriesController < ApplicationController
  def new
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
