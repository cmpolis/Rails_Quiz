require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test "Valid quiz fixture is valid" do
    assert quizzes(:valid).valid?
  end

  test "Quiz can only be private if it belongs to a group" do
    quiz = quizzes(:valid)
    quiz.private = true
    quiz.group_id = nil
    assert !quiz.save
    quiz.group_id = 3
    assert quiz.save

    quiz.private = false
    quiz.group_id = nil
    assert quiz.save
  end

  test "Quiz title must be between 6 and 48 characters" do
    quiz = quizzes(:valid)
    quiz.title = nil
    assert !quiz.save
    quiz.title = "short"
    assert !quiz.save
    quiz.title = "a" * 49
    assert !quiz.save

    quiz.title = "Correct length"
    assert quiz.save
  end
  
  test "Quiz must have a creator" do
    quiz = quizzes(:valid)
    quiz.creator_id = nil
    assert !quiz.save
  end
 
  test "Quiz must be private or public (not private)" do
    quiz = quizzes(:valid)
    quiz.private = nil
    assert !quiz.save
    quiz.private = false
    assert quiz.save
  end
 
end
