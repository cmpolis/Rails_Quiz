require 'test_helper'

class GroupMembershipTest < ActiveSupport::TestCase

  test "Valid group_membership fixture is valid" do
    assert group_memberships(:valid).valid?
  end

end
