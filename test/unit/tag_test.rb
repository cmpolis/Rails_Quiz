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

  # in models/tag.rb: def self.parse quiz, tag_string
  test "Tag.prase creates new tags if they are not yet in db" do
    tags = "fishing, hiking, swimming"
    assert_difference(['Tag.count', 'Tagging.count'], +3) do
      Tag.parse 1, tags
    end
  end

  test "Tag.parse does not create a new tag if it already exists" do
    Tag.parse 1, "music, literature, math"
    assert_no_difference 'Tag.count' do
      Tag.parse 23, "music, math"
    end
    assert_equal 2, Tagging.find_all_by_quiz_id(23).length 
  end

end
