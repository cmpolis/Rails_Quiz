require 'test_helper'

class AnswerEntryTest < ActiveSupport::TestCase
  
  test "Valid answer_entry fixture is valid" do
    assert answer_entries(:valid).valid?
  end

end
