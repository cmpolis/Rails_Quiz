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
  end

  def edit
  end

end
