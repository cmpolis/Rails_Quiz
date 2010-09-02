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

Factory.define :tag do |tag|
  tag.text             { "tag text" }
  tag.id               { 1 }
end

Factory.define :tagging do |tagging|
  tagging.tag_id       { 1 }
  tagging.quiz_id      { 1 }
  tagging.id           { 1 }
end

Factory.define :like do |like|
  like.user_id         { 1 }
  like.quiz_id         { 1 }
  like.id              { 1 }
end

Factory.define :comment do |comment|
  comment.user_id      { 1 }
  comment.quiz_id      { 1 }
  comment.text         { "Commont on a quiz..." }
end
