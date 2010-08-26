class User < ActiveRecord::Base
  include Clearance::User

  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  has_many :admin_groups, :class_name => "group", :foreign_key => "admin_id"
  has_many :created_quizzes, :class_name => "quiz", :foreign_key => "creator_id"
  has_many :quiz_entries
  has_many :quizzes, :through => :quiz_entries

end
