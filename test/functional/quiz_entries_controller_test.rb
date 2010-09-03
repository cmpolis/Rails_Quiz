require 'test_helper'

class QuizEntriesControllerTest < ActionController::TestCase
  
  test "Must be logged in to add comment" do
    @controller.current_user = nil
    get :show, :id => 1
  end

end
