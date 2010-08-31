require 'test_helper'

class AnswerEntryTest < ActiveSupport::TestCase
  
  test "Valid answer_entry fixture is valid" do
    assert answer_entries(:valid).valid?
  end
  
  test "Answer entry must belong to an answer" do
    ae = answer_entries(:valid)
    ae.answer_id = nil
    assert !ae.save
  end

end
