require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "Valid question fixture is valid" do
    assert questions(:valid).valid?
  end

end
