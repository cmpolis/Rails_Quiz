require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "Valid question fixture is valid" do
    assert questions(:valid).valid?
  end

  test "Question must belong to a quiz" do
    question = questions(:valid)
    question.quiz_id = nil
    assert !question.save
  end

  test "Question text is between 10 and 200 characters" do
    question = questions(:valid)

    question.text = nil
    assert !question.save
    question.text = "qwerty"
    assert !question.save
    question.text = "a" * 201
    assert !question.save

    question.text = "Correct length question"
    assert question.save
  end


end
