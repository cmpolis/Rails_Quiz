class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :quizzes, :through => :taggings

  validates_length_of :text, :in => 3..20

  # Gets a string formatted "tag1, tag2, tag3" and an id for a quiz
  # Creates tags if they are not yet in the database
  # Creates tagging for each tag to link with quiz
  def self.parse quiz, tag_string
    tags = tag_string.downcase.split /\s*,\s*/
    tags.each do |tag|
      tag_obj = Tag.find_by_text(tag)
      tag_obj ||= Tag.create(:text => tag)
      tag_obj.taggings.create :quiz_id => quiz
    end
  end

end
