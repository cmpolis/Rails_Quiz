class User < ActiveRecord::Base
  # include Clearance::User
    
  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  has_many :admin_groups, :class_name => "Group", :foreign_key => "admin_id"
  has_many :created_quizzes, :class_name => "Quiz", :foreign_key => "creator_id", :order => "created_at DESC"
  has_many :quiz_entries, :order => "created_at DESC"
  has_many :quizzes, :through => :quiz_entries
  has_many :likes
  has_many :comments

  validates_length_of :bio, :in => 0..80
  validates_length_of :location, :in => 0..40
  validates_length_of :login, :in => 4..16
  validates_inclusion_of :private, :in => [true,false]

  def to_s
    login
  end

end
