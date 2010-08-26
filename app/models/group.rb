class Group < ActiveRecord::Base
  
  has_one :admin, :class_name => "user"
  has_many :group_memberships
  has_many :users, :through => :group_memberships
  has_many :quizzes

end
