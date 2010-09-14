class QuizEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  has_many :answer_entries, :dependent => :delete_all, :autosave => true
  accepts_nested_attributes_for :answer_entries
 
  has_many :answers, :through => :answer_entries

  validates_presence_of :user_id, :quiz_id
 
  # Returns number of correct answers
  def grade_quiz
    self.correct = quiz.correct answers
    self.save
  end

  def possible
    quiz.possible
  end

  # Returns percentile (float)
  def score
    correct.to_f / possible
  end

  # Returns percentile (0-100), comparing to other quiz takers
  def percentile
    scores = quiz.scores.sort
    ((scores.index(score) + 1) * 100) / scores.length
  end

  def to_tweet
    %!"Took quiz '#{quiz.title}', scored #{correct}/#{possible}"!
  end

end
