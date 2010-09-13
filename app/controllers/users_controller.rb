class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.private ||= false
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end

  def show
    @user = User.find params[:id], :include => [:quiz_entries, :created_quizzes]
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
      @user.bio = params[:user][:bio]
      @user.location = params[:user][:location]
      @user.private = params[:user][:private]
      if User.authenticate(@user.login, params[:user][:password]).nil?
        flash[:notice] = "Invalid password, no changes made"
        render :edit
      else
        flash[:notice] = @user.save ? "Profile updated" : "Unable to update profile"
        redirect_to edit_user_path(current_user)
      end
    end
  end

end
