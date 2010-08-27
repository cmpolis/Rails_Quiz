class AnswerEntry < ActiveRecord::Base

  belongs_to :quiz_entry
  belongs_to :answer

  validates_presence_of :answer_id, :quiz_entry_id

end
