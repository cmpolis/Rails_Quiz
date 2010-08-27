class Quiz < ActiveRecord::Base

  has_one :creator, :class_name => "user"
  belongs_to :group

  has_many :questions
  has_many :answers, :through => :questions
  has_many :quiz_entries
  has_many :answer_entries, :through => :quiz_entries
  has_many :users, :through => :quiz_entries

  validates_presence_of :group_id, :if => Proc.new {|quiz| quiz.private == true}
  validates_presence_of :creator_id
  validates_length_of :title, :in => 6..48

end
