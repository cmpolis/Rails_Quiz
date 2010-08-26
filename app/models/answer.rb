class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :quiz, :through => :question
 
  has_many :answer_entries
  has_many :quiz_entries, :through => :answer_entries

end
