require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "Valid group fixture is valid" do
    assert groups(:valid).valid?
  end

  test "Group must have an admin" do
    group = groups(:valid)
    group.admin_id = nil
    assert !group.save
  end

  test "Group must have a name between 3 and 20 characters" do
    group = groups(:valid)
    group.name = "a"
    assert !group.save
    group.name = "Longer than 20 characters lorem ipsum..... kjads"
    assert !group.save
    group.name = "Correct length"
    assert group.save
  end


end
