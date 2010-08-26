require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
 
  test "Valid answer fixture is valid" do
    assert answers(:valid).valid?
  end

end
