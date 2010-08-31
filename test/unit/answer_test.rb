require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
 
  test "Valid answer fixture is valid" do
    assert answers(:valid).valid?
  end

  test "Answer text is between 2 and 140 characters" do
    answer = answers(:valid)
    
    answer.text = nil
    assert !answer.save
    answer.text = "a"
    assert !answer.save
    answer.text = "a" * 145
    assert !answer.save

    answer.text = "Correct answer"
    assert answer.save
  end

  test "Answer is either right or wrong" do
    answer = answers(:valid)
    answer.right = nil
    assert !answer.save
    answer.right = true
    assert answer.save
    answer.right = false
    assert answer.save
  end  

end
