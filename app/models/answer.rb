class Answer < ActiveRecord::Base

  has_one :question
  has_one :quiz, :through => :question
 
  has_many :answer_entries
  has_many :quiz_entries, :through => :answer_entries

end
