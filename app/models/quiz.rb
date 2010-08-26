class Quiz < ActiveRecord::Base

  belongs_to :creator, :class_name => "user"
  belongs_to :group

  has_many :questions
  has_many :answers, :through => :questions
  has_many :quiz_entries
  has_many :answer_entries, :through => :quiz_entries
  has_many :users, :through => :quiz_entries

end
