class Category < ActiveRecord::Base

  validates_presence_of :title
  
  has_many :children, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

  has_many :quizzes

  def to_s
    title
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
