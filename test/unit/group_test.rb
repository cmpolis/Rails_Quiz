require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "Valid group fixture is valid" do
    assert groups(:valid).valid?
  end

end
