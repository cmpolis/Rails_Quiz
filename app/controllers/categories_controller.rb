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
   @category = Category.find_by_id params[:id], :include => "quizzes"
   if @category.nil?
     flash[:notice] = "Invalid category ID"
     redirect_to root_url
   else
     @quizzes = @category.quizzes.paginate :page => params[:page], :conditions => "published=true"
     respond_to do |format|
     format.html
     format.js {
       render :update do |page|
         # 'page.replace' will replace full "results" block...works for this example
         # 'page.replace_html' will replace "results" inner html...useful elsewhere
         page.replace 'category_quizzes', :partial => 'show_quizzes'
       end
     }
     end
    end
  end

  def update
  end

end
