require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  
  test "Must be quiz creator for question#new" do
    @controller.current_user = nil
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]
    @controller.current_user = 2384
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]

    @controller.current_user = Factory(:user)
    quiz = quizzes(:valid)
    quiz.creator_id = @controller.current_user
    quiz.save
    get :new, :id => quiz.id
    assert_template :new
  end

end
