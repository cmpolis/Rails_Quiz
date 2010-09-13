class Feedback < ActiveRecord::Base
  validates_length_of :body, :in => 10..140
end
