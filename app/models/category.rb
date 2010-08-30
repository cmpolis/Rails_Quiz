class Category < ActiveRecord::Base

  validates_presence_of :title
  
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category"

end
