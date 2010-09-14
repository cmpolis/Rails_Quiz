class Question < ActiveRecord::Base
  
  belongs_to :quiz
  has_many :answers, :dependent => :delete_all

  accepts_nested_attributes_for :answers

  validates_presence_of :quiz_id

  validates_length_of :text, :in => 3..140

  # returns answer object of right answer
  def right_ans
    answers.find_by_right true
  end

  # returns lowercase string of first answer
  # used to check short answer questions
  def first_answer
    answers.first.text.downcase
  end
    
end
