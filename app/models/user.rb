class User < ActiveRecord::Base
  include Clearance::User

  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  has_many :admin_groups, :class_name => "Group", :foreign_key => "admin_id"
  has_many :created_quizzes, :class_name => "Quiz", :foreign_key => "creator_id"
  has_many :quiz_entries
  has_many :quizzes, :through => :quiz_entries
  has_many :likes
  has_many :comments

  validates_length_of :username, :in => 4..16
  validates_inclusion_of :private, :in => [true,false]

  def to_s
    username
  end

end
