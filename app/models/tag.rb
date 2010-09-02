class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :quizzes, :through => :taggings

  validates_length_of :text, :in => 3..20


end
