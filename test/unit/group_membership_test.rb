require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase

  test "Valid group_membership fixture is valid" do
    assert group_memberships(:valid).valid?
  end

  test "Group membership belongs to a user" do
    gm = group_memberships(:valid)
    gm.user_id = nil
    assert !gm.save
  end

  test "Group membership belongs to a group" do
    gm = group_memberships(:valid)
    gm.group_id = nil
    assert !gm.save
  end

 
end
