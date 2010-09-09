# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Categories = ["Just for Fun", "Math", "Science", "Test Prep", "History", 
  "Geography", "Art", "Music", "Movies", "Television", "Video Games", 
  "Literature", "History", "Sports"]
Categories.each do |name|
    Category.create :title => name
end