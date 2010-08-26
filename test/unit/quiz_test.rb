require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test "Valid quiz fixture is valid" do
    assert quizzes(:valid).valid?
  end

end
