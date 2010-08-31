class Question < ActiveRecord::Base
  
  belongs_to :quiz
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :answers

  validates_presence_of :quiz_id

  validates_length_of :text, :in => 10..200

  # returns answer object of right answer
  def right_ans
    answers.find_by_right true
  end

end
