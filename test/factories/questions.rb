Factory.define :question do |question|
  question.quiz_id     { 1 }
  question.type        { nil }
  question.text        { "What is Dwight Schrute's middle name?" }
  question.id          { 3 }
end

Factory.define :answer1 do |answer|
  answer.right         { false }
  answer.text          { "Frank" }
  answer.question_id   { 3 }
end

Factory.define :answer2 do |answer|
  answer.right         { true }
  answer.text          { "Kurt" }
  answer.question_id   { 3 }
end

Factory.define :answer3 do |answer|
  answer.right         { false }
  answer.text          { "Mose" }
  answer.question_id   { 3 }
end

Factory.define :answer4 do |answer|
  answer.right         { false }
  answer.text          { "Bill" }
  answer.question_id   { 3 }
end

