class AnswerEntry < ActiveRecord::Base

  belongs_to :quiz_entry, :foreign_key => "QuizEntry_id", :class_name => "QuizEntry"
  belongs_to :answer

end
