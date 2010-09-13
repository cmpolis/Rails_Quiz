class Report < ActiveRecord::Base
  ReportTypes = ["False Information", "Spam/Solicitation",
    "Explicit Material", "Support", "Feedback"]

  belongs_to :quiz
  belongs_to :user

  def self.quiz_reports
    ReportTypes[0..2]
  end

  def self.site_reports
    ReportTypes[3..4]
  end
  
end
