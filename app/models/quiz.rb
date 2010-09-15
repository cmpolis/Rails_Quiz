class Quiz < ActiveRecord::Base

  QUIZ_TYPES = ["MultipleChoice","List","ShortAnswer"] # TODO: matching
  
  belongs_to :creator, :class_name => "User"
  belongs_to :group
  belongs_to :category

  has_many :questions, :dependent => :delete_all
  has_many :answers, :through => :questions
  has_many :quiz_entries, :dependent => :delete_all
  has_many :answer_entries, :through => :quiz_entries
  has_many :users, :through => :quiz_entries

  has_many :taggings, :dependent => :delete_all
  has_many :tags, :through => :taggings

  has_many :comments, :dependent => :delete_all, :order => "created_at ASC"
  has_many :likes

  validates_inclusion_of :featured, :in => [true, false]
  # validates_inclusion_of :private, :in => [true, false]
  # validates_presence_of :group_id, :if => Proc.new {|quiz| quiz.private == true}
  validates_presence_of :creator_id
  validates_length_of :title, :in => 6..30
  validates_length_of :description, :in => 10..50
  
  #Will_Paginate
  cattr_reader :per_page
  @@per_page = 7

  def self.search query
    results = []
    tags = Tag.find(:all, :conditions => ["text like ?", "%#{query.downcase}%"])
    tags.each { |t| results += t.quizzes.find(:all, :conditions => "published=true") }
    results += Quiz.find(:all, :conditions => ["title like ? and published = ?", "%#{query.downcase}%", true])
    results += Quiz.find(:all, :conditions => ["description like ? and published = ?", "%#{query.downcase}%", true])
    results.uniq
  end

  def self.types
    QUIZ_TYPES
  end

  def publish
    self.published = true
    self.possible = possible_count
    self.save
    logger.debug "SAVING QUIZ: #{self.errors.full_messages}"
  end
  
  # Returns an array of all the scores recieved for a quiz
  def scores
    quiz_entries.collect { |qe| qe.score }
  end

  def avg_score
    scores.inject(0.0) { |sum, score| sum + score } / (scores.count * 0.01)
  end

  def like_count
    likes.count
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def to_s
    title
  end

  def taken
    update_attribute(:times_taken, times_taken+1)
  end

end
