require 'test_helper'

class LikeTest < ActiveSupport::TestCase

  test "Valid like fixture is valid" do
    assert Factory(:like).save
  end

  test "Like responds to associations" do
    like = Factory(:like)
    assert like.respond_to? "user"
    assert like.respond_to? "quiz"
  end
 
  test "Like must belong to a user" do
    like = Factory(:like)
    like.user_id = nil
    assert !like.save
  end
 
  test "Like must belong to a quiz" do
    like = Factory(:like)
    like.quiz_id = nil
    assert !like.save
  end

end
