require 'test_helper'

class QuizEntryTest < ActiveSupport::TestCase
  
  test "Valid quiz_entry fixture is valid" do
    assert quiz_entries(:valid).valid?
  end

  test "Quiz entry must belong to a user" do
    qe = quiz_entries(:valid)
    qe.user_id = nil
    assert !qe.save 
  end

  test "Quiz entry must belong to a quiz" do
    qe = quiz_entries(:valid)
    qe.quiz_id = nil
    assert !qe.save
  end


end
