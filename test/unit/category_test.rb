require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "Valid category factory is valid" do
    cat = Factory(:category)
    assert cat.save
  end

  test "Category must have a title" do
    cat = Factory(:category)
    cat.title = nil
    assert !cat.save
    cat.title = "This should work!"
    assert cat.save
  end

end
