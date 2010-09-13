class Report < ActiveRecord::Base
  ReportTypes = { "False Information" => "1", "Spam/Solicitation" => "2",
    "Explicit Material" => "3" }

  belongs_to :quiz
  belongs_to :user

  def self.reasons_hash
    ReportTypes
  end
  
end
