class SupportsController < ApplicationController
  def new
    @support = Support.new
    @support.email = current_user.email if logged_in?
  end

  def create
    @support = Support.new(params[:support])
    @support.user_id = current_user.id
    @support.status ||= 1
    if @support.save
      flash[:notice] = "Ticket has been saved, our team will review it shortly"
      redirect_to root_url
    else
      flash[:notice] = "Errors with support ticket"
      render :new
    end
  end

  def index
  end

end
