Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
  user.username              { "quizTaker" }
  user.full_name             { "John Doe" }
  user.bio                   { "Im a web dev hobo" }
  user.location              { "Bay area, CA" }
  user.email_confirmed       { true }
  user.private               { false }
end

Factory.define :user_high_id, :parent => :user do |user|
  user.id  { 123 }
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.email_confirmed { true }
end
