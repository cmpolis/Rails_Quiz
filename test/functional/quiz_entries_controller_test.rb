require 'test_helper'

class QuizEntriesControllerTest < ActionController::TestCase
  
  test "Must be logged in to take quiz" do
    @controller.current_user = nil
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be logged in to take quiz", flash[:notice]
  end

  test "Can only take a quiz once, redirects to results" do
    user = Factory(:user)
    quiz = Quiz.find(1)
    quiz.creator_id = user.id
    quiz.save
    @controller.current_user = user
    qe = QuizEntry.create :user_id => user.id, :quiz_id => quiz.id
    get :new, :id => 1
    assert_redirected_to :action => "show", :id => qe.id
    assert_equal "Already taken quiz", flash[:notice]
  end

end
