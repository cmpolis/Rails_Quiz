Factory.define :quiz do |quiz|
  quiz.group_id        { nil }
  quiz.private         { false }
  quiz.creator_id      { 1 }
  quiz.title           { "Valid quiz fixture" }
  quiz.featured        { false }
  quiz.category_id     { nil }
end

Factory.define :category do |cat|
  cat.title            { "Entertainment" }
  cat.parent_id        { nil }
  cat.id               { 30 }
end

Factory.define :category_child do |cat|
  cat.title            { "Television" }
  cat.parent_id        { 30 }
end

Factory.define :group do |group|
  group.admin_id       { 1 }
  group.name           { "Valid group" }
  group.id             { 1 }
end
