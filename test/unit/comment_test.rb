require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test "Valid comment fixture is valid" do
    assert Factory(:comment).save
  end

  test "Comment must have text between 5 and 140 characters" do
    comment = Factory(:comment)
    comment.text = nil
    assert !comment.save
    comment.text = "abc"
    assert !comment.save
    comment.text = "a" * 145
    assert !comment.save
    comment.text = "valid comment length"
    assert comment.save
  end

  test "Comment must belong to a user" do
    comment = Factory(:comment)
    comment.user_id = nil
    assert !comment.save
  end

  test "Comment must belong to a quiz" do
    comment = Factory(:comment)
    comment.quiz_id = nil
    assert !comment.save
  end

  test "Comment responds to associations" do
    comment = Factory(:comment)
    assert comment.respond_to? "quiz"
    assert comment.respond_to? "user"
  end

end
