class GroupsController < ApplicationController
  def new
    if current_user.nil?
      flash[:notice] = "Must be logged in to make a group"
      redirect_to root_url
    else
      render :new
      @group = Group.new
    end    
  end

  def create
    @group = Group.new params[:group]
    if @group.save
      redirect_to :controller => "groups", :action => "show", :id => @group.id
    else
      render :new
    end
  end

  def show
    @group = Group.find params[:id]
  end

  def edit
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "Group deleted #{Group.delete params[:id]}"
      redirect_to request.referer
    else
      flash[:notice] = "Must be admin to delete group"
    end
  end

  def index
    @groups = Group.all
  end

end
