class QuizEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  validates_presence_of :user_id, :quiz_id
end
