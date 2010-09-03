Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
  user.username              { "quizTaker" }
  user.first_name            { "Michael" }
  user.last_name             { "Scott" }
  user.email_confirmed       { true }
end

Factory.define :user_high_id, :parent => :user do |user|
  user.id  { 123 }
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.email_confirmed { true }
end
