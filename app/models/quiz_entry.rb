class QuizEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  has_many :answer_entries, :dependent => :destroy, :autosave => true
  accepts_nested_attributes_for :answer_entries
 
  has_many :answers, :through => :answer_entries

  validates_presence_of :user_id, :quiz_id
 
  # Returns number of correct answers
  def correct
    (answers.find_all_by_right(true)).length
  end
   
  def possible
    quiz.questions.length
  end

end
