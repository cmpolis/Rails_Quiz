class Group < ActiveRecord::Base
  
  has_one :admin, :class_name => "User"

  has_many :group_memberships
  has_many :users, :through => :group_memberships

  has_many :quizzes

  validates_presence_of :admin_id
  validates_length_of :name, :in => 3...20

end
