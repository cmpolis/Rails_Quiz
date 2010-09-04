require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  # Validations for email, password included with Clearance

  test "User factory is valid" do
    user = Factory(:user)
    assert !user.id.nil?
  end

  test "Username should be between 4 and 16 characters" do
    user = Factory(:user)
    user.username = nil
    assert !user.save
    user.username = "3ch"
    assert !user.save
    user.username = "a" * 17
    assert !user.save
    user.username = "quizman"
    assert user.save
  end

  test "Profile must be private or not private" do
    user = Factory(:user)
    user.private = nil
    assert !user.save
  end

end
