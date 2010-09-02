require 'test_helper'

class TagTest < ActiveSupport::TestCase
  
  test "Valid tag fixture is valid" do
    assert Factory(:tag).save
  end

  test "Tag must have text, between 3 and 20 characters" do
    tag = Factory(:tag)
    tag.text = nil
    assert !tag.save
    tag.text = "ab"
    assert !tag.save
    tag.text = "abc" * 10
    assert !tag.save
    tag.text = "valid length"
    assert tag.save
  end

  test "Tag responds to associations" do
    tag = Factory(:tag)
    assert tag.respond_to? "quizzes"
    assert tag.respond_to? "taggings"
  end

end
