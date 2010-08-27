class Answer < ActiveRecord::Base

  has_one :question
  has_one :quiz, :through => :question
 
  has_many :answer_entries
  has_many :quiz_entries, :through => :answer_entries

  validates_length_of :text, :in => (2..140)
  validates_inclusion_of :right, :in => [true,false]
  validates_presence_of :question_id
end
