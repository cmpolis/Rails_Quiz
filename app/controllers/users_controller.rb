class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @quiz_entries = @user.quiz_entries
  end

  def new
    if signed_in?
      flash[:notice] = "Already registered"
      redirect_to root_url
    else
      @user = User.new params[:user]
      render :new
    end
  end

  def create
    @user = ::User.new params[:user]
    if @user.save
      flash_notice_after_create
      redirect_to(url_after_create)
    else
      render :template => 'users/new'
    end
  end

  def flash_notice_after_create
    flash[:notice] = translate(:deliver_confirmation,
      :scope   => [:clearance, :controllers, :users],
      :default => "You will receive an email within the next few minutes. " <<
                  "It contains instructions for confirming your account.")
  end

  def url_after_create
    root_url
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "User deleted #{User.delete params[:id]}"
      redirect_to request.referer
    else
      flash[:notice] = "Must be admin to delete user"
    end
  end

end

