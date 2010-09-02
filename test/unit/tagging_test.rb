require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  
  test "Valid tagging fixture is valid" do
    assert Factory(:tagging).save
  end

  test "Tagging must belong to a quiz" do
    tagging = Factory(:tagging)
    tagging.quiz_id = nil
    assert !tagging.save
  end

  test "Tagging must belong to a tag" do
    tagging = Factory(:tagging)
    tagging.tag = nil
    assert !tagging.save
  end

  test "Responds to associations" do
    tagging = Factory(:tagging)
    assert tagging.respond_to? "tag"
    assert tagging.respond_to? "quiz"
  end

end
