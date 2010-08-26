require 'test_helper'

class QuizEntryTest < ActiveSupport::TestCase
  
  test "Valid quiz_entry fixture is valid" do
    assert quiz_entries(:valid).valid?
  end

end
