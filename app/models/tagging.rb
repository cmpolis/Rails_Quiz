class Tagging < ActiveRecord::Base

  validates_presence_of :quiz_id, :tag_id
 
  belongs_to :quiz
  belongs_to :tag

end
