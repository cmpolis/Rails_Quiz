# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100913112118) do

  create_table "answer_entries", :force => true do |t|
    t.integer  "quiz_entry_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_entries", ["quiz_entry_id", "answer_id"], :name => "index_answer_entries_on_quiz_entry_id_and_answer_id"

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.boolean  "right"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id", "quiz_id"], :name => "index_comments_on_user_id_and_quiz_id"

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "admin_id"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["user_id", "quiz_id"], :name => "index_likes_on_user_id_and_quiz_id"

  create_table "questions", :force => true do |t|
    t.integer  "quiz_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["quiz_id"], :name => "index_questions_on_quiz_id"

  create_table "quiz_entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.integer  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_entries", ["user_id", "quiz_id"], :name => "index_quiz_entries_on_user_id_and_quiz_id"

  create_table "quizzes", :force => true do |t|
    t.string   "type"
    t.boolean  "published"
    t.integer  "creator_id"
    t.string   "title"
    t.string   "description"
    t.integer  "possible"
    t.integer  "times_taken"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured"
  end

  add_index "quizzes", ["creator_id", "category_id", "times_taken"], :name => "index_quizzes_on_creator_id_and_category_id_and_times_taken"

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "fixed"
    t.string   "text"
    t.integer  "quiz_id"
    t.integer  "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["user_id", "quiz_id"], :name => "index_reports_on_user_id_and_quiz_id"

  create_table "supports", :force => true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id", "quiz_id"], :name => "index_taggings_on_tag_id_and_quiz_id"

  create_table "tags", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "bio"
    t.string   "location"
    t.string   "username"
    t.boolean  "private"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
