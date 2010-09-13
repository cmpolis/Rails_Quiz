=begin
DEPRICIATED W/ AUTHLOGIC

  def show
    @user = User.find params[:id]
    if !@user.private || current_user == @user
      @taken = @user.quiz_entries
      @created = @user.created_quizzes
      render "public_profile"
    else
      render "private_profile"
    end
  end

  def edit
    @user = User.find params[:id]
    if current_user != @user
      flash[:notice] = "Must be logged in as #{@user} to edit profile"
      redirect_to root_url
    else
      render :edit
    end
  end

  def update
    @user = User.find params[:id]
    if current_user != @user
      flash[:notice] = "Must be logged in as #{@user} to edit profile"
      redirect_to root_url
    else
      if params[:user]
        if User.authenticate(@user.email, params[:user][:password]).nil?
          flash[:notice] = "Invalid password, no changes made"
        else
          @user.bio = params[:user][:bio]
          @user.location = params[:user][:location]
          @user.private = params[:user][:private]
          flash[:notice] = @user.save ? "Profile updated" : "Unable to update profile"
        end
      end
      render :edit
    end
  end

  def new
    if logged_in?
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
      redirect_to root_url
    else
      render :template => 'users/new'
    end
  end

  def destroy
    if user_is_admin?
      flash[:notice] = "User deleted #{User.delete params[:id]}"
      redirect_to request.referer
    else
      flash[:notice] = "Must be admin to delete user"
    end
  end

=end
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
