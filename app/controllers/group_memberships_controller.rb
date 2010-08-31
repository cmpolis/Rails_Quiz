class GroupMembershipsController < ApplicationController
  def new
  end

  def create
    if current_user.nil?
      flash[:notice] = "Must be logged in to join a group"
      redirect_to root_url
    else
      # test for password, if applicable
      gm = GroupMembership.new :group_id => params[:group_id], :user_id => current_user.id
      if gm.save
        flash[:notice] = "Joined group #{gm.group.name}"
      else
        flash[:notice] = "Unable to join group #{gm.errors.full_messages}"
      end
      redirect_to root_url
    end
  end

  def show
  end

end
