class QuizEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  has_many :answer_entries, :dependent => :destroy
  accepts_nested_attributes_for :answer_entries

  validates_presence_of :user_id, :quiz_id
end
