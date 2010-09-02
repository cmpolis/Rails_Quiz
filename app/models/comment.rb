class Comment < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :user

  validates_length_of :text, :in => 5..140
  validates_presence_of :user_id, :quiz_id
end
