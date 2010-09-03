class Quiz < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"
  belongs_to :group
  belongs_to :category

  has_many :questions
  has_many :answers, :through => :questions
  has_many :quiz_entries
  has_many :answer_entries, :through => :quiz_entries
  has_many :users, :through => :quiz_entries

  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :comments
  has_many :likes

  validates_inclusion_of :featured, :in => [true, false]
  validates_inclusion_of :private, :in => [true, false]
  validates_presence_of :group_id, :if => Proc.new {|quiz| quiz.private == true}
  validates_presence_of :creator_id
  validates_length_of :title, :in => 6..48

  def self.search query
    results = []
    tags = Tag.find(:all, :conditions => ["text like ?", "%#{query.downcase}%"])
    tags.each { |t| results += t.quizzes }
    results += Quiz.find(:all, :conditions => ["title like ?", "%#{query.downcase}%"])
    results.uniq
  end

  # Returns an array of all the scores recieved for a quiz
  def scores
    quiz_entries.collect { |qe| qe.score }
  end

end
