class AnswerEntry < ActiveRecord::Base

  belongs_to :quiz_entry
  belongs_to :answer

  # Validation for presence of quiz_entry makes answer_entry unable to save
  #   when quiz_entry is being saved for the first time...
  validates_presence_of :answer_id #, :quiz_entry_id

end
