require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
=begin
  test "Redirect to root if question#new gives invalid id" do
    get :new, :id => nil
    assert_redirected_to root_url
    assert_equal "Invalid quiz id"

    get :new, :id => 12345
    assert_redirected_to root_url
    assert_equal "Invalid quiz id" 
  end  
=end
  test "Must be quiz creator for question#new" do
    @controller.current_user = nil
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]
    @controller.current_user = 2384
    get :new, :id => 1
    assert_redirected_to root_url
    assert_equal "Must be quiz creator to add a question", flash[:notice]
  
    user = Factory(:user)
    @controller.current_user = user
    quiz = quizzes(:valid)  
    quiz.creator_id = @controller.current_user
    quiz.save
    get :new, :id => quiz.id
    assert_template :new
  end

end
