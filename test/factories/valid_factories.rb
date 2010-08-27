#Factory.sequence :email do |n|
#  "user#{n}@example.com"
#end

Factory.define :quiz do |quiz|
  quiz.group_id        { nil }
  quiz.private         { false }
  quiz.creator_id      { 1 }
  quiz.title           { "Valid quiz fixture" }
end
