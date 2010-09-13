class ReportsController < ApplicationController
  def new
    @report = Report.new
    @quiz = Quiz.find_by_id params[:id]
    if @quiz.nil?
      flash[:notice] = "Invalid quiz ID"
      redirect_to root_url
    end
  end

  def create
    @report = Report.new(params[:report])
    @report.user_id = current_user.id
    @report.fixed ||= 0
    if @report.save
      flash[:notice] = "Quiz has been reported, our team will review it shortly"
      redirect_to root_url
    else
      flash[:notice] = "Errors with quiz report"
      render :new
    end
  end

  def index
  end

end
